'use strict';
// Algorithm-equivalent port of test/bench_application_workloads.nut; Node and GJS share this file.
function makeInputs(seed) {
  const codes = [], words = [], next = [], weights = [];
  for (let i = 0; i < 4096; i++) {
    codes.push((i * 73 + seed * 19) % 1024);
    words.push('word_' + ((i * 37 + seed) % 257));
    next.push((i * 109 + 89 + seed * 2) % 4096);
    weights.push((i * 31 + seed) % 997);
  }
  return {codes, words, next, weights, seed};
}
function routeStep(acc, code, threshold) {
  let delta = 0;
  if (code < threshold) delta = code * 3 + 11;
  else delta = code * 7 + 23;
  return (acc + delta) % 1000003;
}
function routeEvents(n, data, threshold) {
  const codes = data.codes, size = codes.length;
  let acc = 17;
  for (let i = 0; i < n; i++) acc = routeStep(acc, codes[i % size], threshold);
  return acc;
}
function routeBalanced(n, data) { return routeEvents(n, data, 512); }
function routeSkewed(n, data) { return routeEvents(n, data, 1000); }
function priceEvent(price, quantity, category, cap) {
  price = price * quantity;
  if (quantity === 0) return 0;
  if (category < 2) return price + 17;
  if (price > cap) price = cap;
  return price + category * 3;
}
function pricingEvents(n, data) {
  const codes = data.codes, size = codes.length;
  let sum = 0;
  for (let i = 0; i < n; i++) {
    const code = codes[i % size], price = code + 19, quantity = i % 11;
    sum = (sum + priceEvent(price, quantity, code % 7, 4000) + price + quantity) % 1000003;
  }
  return sum;
}
function filterStep(previous, sample, mode) {
  if (mode < 3) return previous * 0.75 + sample * 0.25;
  return previous * 0.5 + sample * 0.5;
}
function filterStream(n, data) {
  const codes = data.codes, size = codes.length;
  let value = 0.5, sum = 0.0;
  for (let i = 0; i < n; i++) {
    value = filterStep(value, codes[i % size], i % 5);
    sum += value * 0.0001;
  }
  return sum + value;
}
function recordUpdates(n, data, size) {
  const records = [];
  for (let i = 0; i < size; i++) {
    if (i % 2 === 0) records.push({balance: i % 97, count: 0, weight: i % 7 + 1});
    else records.push({weight: i % 7 + 1, count: 0, balance: i % 97});
  }
  let sum = 0;
  const seed = data.seed;
  for (let i = 0; i < n; i++) {
    const row = records[(i * 73 + seed) % size];
    row.balance = (row.balance + i % 31 + row.weight) % 1009;
    row.count += 1;
    sum = (sum + row.balance * row.weight + row.count) % 1000003;
  }
  return sum;
}
function records64(n, data) { return recordUpdates(n, data, 64); }
function records4096(n, data) { return recordUpdates(n, data, 4096); }
function wordCount(n, data) {
  const words = data.words, size = words.length, counts = Object.create(null);
  let sum = 0;
  for (let i = 0; i < n; i++) {
    const key = words[i % size];
    if (key in counts) counts[key] += 1;
    else counts[key] = 1;
    sum = (sum + counts[key] * key.length) % 1000003;
  }
  return sum;
}
function graphWalk(n, data) {
  const next = data.next, weights = data.weights;
  let cursor = data.seed % 4096, sum = 0;
  for (let i = 0; i < n; i++) {
    cursor = next[cursor];
    sum = (sum + weights[cursor]) % 1000003;
  }
  return sum + cursor;
}
const isNode = typeof process !== 'undefined';
const args = isNode ? process.argv.slice(2) : ARGV;
const iterations = Number(args[0] || 200000), warmups = Number(args[1] || 5);
const data = makeInputs(Number(args[2] || 17));
const now = isNode ? () => Number(process.hrtime.bigint()) / 1000
                   : () => imports.gi.GLib.get_monotonic_time();
const output = isNode ? line => console.log(line) : line => print(line);
const cases = [
  ['route_balanced', routeBalanced], ['route_skewed', routeSkewed],
  ['pricing_events', pricingEvents], ['filter_stream', filterStream],
  ['records_64', records64], ['records_4096', records4096],
  ['word_count', wordCount], ['graph_walk', graphWalk],
];
for (const [name, fn] of cases) {
  let warm;
  for (let w = 0; w < warmups; w++) warm = fn(iterations, data);
  const start = now(), checksum = fn(iterations, data), elapsed = now() - start;
  if (warmups > 0 && checksum !== warm) throw new Error('unstable application checksum');
  output(['BENCH', name, iterations, (elapsed / iterations).toFixed(9), checksum].join('\t'));
}
