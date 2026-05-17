#!/usr/bin/env gjs

const GLib = imports.gi.GLib;

let scale = 1;
for (const arg of ARGV) {
  if (arg.startsWith("--scale=")) {
    scale = Math.max(1, Number.parseInt(arg.slice(8), 10) || 1);
  }
}

function nowUs() {
  return GLib.get_monotonic_time();
}

function emit(name, n, startedUs, checksum) {
  const ms = (GLib.get_monotonic_time() - startedUs) / 1000.0;
  print(`gjs\t${name}\t${n}\t${ms.toFixed(3)}\t${checksum}`);
}

function benchNumeric(n) {
  const started = nowUs();
  let x = 0;
  for (let i = 0; i < n; i++) {
    x = (x + (i % 997) * 31 + 7) % 1000000007;
  }
  emit("numeric", n, started, x);
}

function benchEmptyLoop(n) {
  const started = nowUs();
  let x = 0;
  for (let i = 0; i < n; i++) {
    x = i;
  }
  emit("empty-loop", n, started, x);
}

function inc(x) {
  return x + 1;
}

function benchFunctionCall(n) {
  const started = nowUs();
  let x = 0;
  for (let i = 0; i < n; i++) {
    x = inc(x);
  }
  emit("function-call", n, started, x);
}

function benchArray(n) {
  const started = nowUs();
  const a = [];
  for (let i = 0; i < n; i++) {
    a.push(i % 251);
  }
  let sum = 0;
  for (let i = n - 1; i >= 0; i--) {
    sum = (sum + a[i]) % 1000000007;
  }
  emit("array", n, started, sum);
}

function benchTable(n) {
  const keys = [];
  for (let i = 0; i < 2048; i++) {
    keys.push(`k${i}`);
  }
  const table = Object.create(null);
  for (const k of keys) {
    table[k] = 0;
  }

  const started = nowUs();
  for (let i = 0; i < n; i++) {
    const k = keys[i % keys.length];
    table[k] += 1;
  }
  let sum = 0;
  for (const k of keys) {
    sum += table[k];
  }
  emit("table", n, started, sum);
}

function benchString(n) {
  const started = nowUs();
  let s = "";
  for (let i = 0; i < n; i++) {
    s += "sqgi:";
    s += String(i % 100);
    s += ";";
  }
  emit("string", n, started, s.length);
}

function benchGlibClock(n) {
  const started = nowUs();
  let x = 0;
  for (let i = 0; i < n; i++) {
    x = (x + (GLib.get_monotonic_time() % 97)) % 1000000007;
  }
  emit("glib-clock", n, started, x);
}

benchEmptyLoop(2000000 * scale);
benchNumeric(1000000 * scale);
benchFunctionCall(500000 * scale);
benchArray(300000 * scale);
benchTable(250000 * scale);
benchString(30000 * scale);
benchGlibClock(200000 * scale);
