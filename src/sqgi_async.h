#pragma once

#include <squirrel.h>
#include <glib.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 * sqgi_async_register
 *
 * Installs the JS-style async runtime into the VM's root table under `sqgi`:
 *
 *   sqgi.Task()                 — new pending Task.
 *   sqgi.sleep(ms)              — Task that resolves after `ms` with elapsed ms.
 *   sqgi.timeout_add(ms, fn)    — schedule `fn()` after `ms` ms. fn returns
 *                                true to repeat, false/null to stop. Returns
 *                                the GLib source id.
 *   sqgi.source_remove(id)      — cancel a timeout source.
 *
 * Task methods (via hidden delegate):
 *   t.resolve(v)               — fulfill; wakes waiters.
 *   t.reject(e)                — reject; wakes waiters.
 *   t.then(fn)                 — chain a continuation; returns a derived Task.
 *   t.catch(fn)                — chain a rejection handler.
 *
 * Internal hooks (compiler-emitted bytecode for `async function` / `await`):
 *   sqgi.__make_async(fn)       — wrap fn into an async-launcher closure.
 *   sqgi.__await(x)             — suspend until x settles (x: Task or int ms).
 *
 * Typical usage:
 *
 *   async function fetchTwice() {
 *       local a = await sqgi.sleep(50);
 *       local b = await sqgi.sleep(50);
 *       return a + b;
 *   }
 *
 *   fetchTwice().then(function(v) { print("total: " + v + "\n"); });
 *   GLib.MainLoop.new(null, false).run();
 */
void sqgi_async_register(HSQUIRRELVM v);

#ifdef __cplusplus
}
#endif
