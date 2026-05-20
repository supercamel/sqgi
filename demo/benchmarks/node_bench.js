#!/usr/bin/env node

let scale = 1;
for (const arg of process.argv.slice(2)) {
  if (arg.startsWith("--scale=")) {
    scale = Math.max(1, Number.parseInt(arg.slice(8), 10) || 1);
  }
}

function nowNs() {
  return process.hrtime.bigint();
}

function emit(name, n, started, checksum) {
  const ms = Number(nowNs() - started) / 1_000_000;
  console.log(`node\t${name}\t${n}\t${ms.toFixed(3)}\t${checksum}`);
}

function benchNumeric(n) {
  const started = nowNs();
  let x = 0;
  for (let i = 0; i < n; i++) {
    x = (x + (i % 997) * 31 + 7) % 1000000007;
  }
  emit("numeric", n, started, x);
}

function numericKernel(n) {
  let x = 0;
  for (let i = 0; i < n; i++) {
    x = (x + (i % 997) * 31 + 7) % 1000000007;
  }
  return x;
}

function benchNumericKernel(n) {
  for (let i = 0; i < 1000; i++) {
    numericKernel(0);
  }
  const started = nowNs();
  emit("numeric-kernel", n, started, numericKernel(n));
}

function benchEmptyLoop(n) {
  const started = nowNs();
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
  const started = nowNs();
  let x = 0;
  for (let i = 0; i < n; i++) {
    x = inc(x);
  }
  emit("function-call", n, started, x);
}

function benchArray(n) {
  const started = nowNs();
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

  const started = nowNs();
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
  const started = nowNs();
  let s = "";
  for (let i = 0; i < n; i++) {
    s += "sqgi:";
    s += String(i % 100);
    s += ";";
  }
  emit("string", n, started, s.length);
}

benchEmptyLoop(2000000 * scale);
benchNumeric(1000000 * scale);
benchNumericKernel(1000000 * scale);
benchFunctionCall(500000 * scale);
benchArray(300000 * scale);
benchTable(250000 * scale);
benchString(30000 * scale);
console.log(`node\tglib-clock\t${200000 * scale}\tSKIP\tno built-in GI bridge`);
