# GLibUnix 2.0

SQGI import: `import("GLibUnix", "2.0")`

Packages: `glib-2.0`
Includes: `GLib-2.0`
Libraries: `libgobject-2.0.so.0`, `libglib-2.0.so.0`

## Overview

| Kind | Count |
| --- | --- |
| Classes | 0 |
| Interfaces | 0 |
| Records | 1 |
| Unions | 0 |
| Enums | 1 |
| Flags | 0 |
| Functions | 12 |
| Callbacks | 1 |
| Constants | 0 |
| Aliases | 0 |

## Enums

### GLibUnix.PipeEnd

C type: `GUnixPipeEnd`

Mnemonic constants for the ends of a Unix pipe.

#### Members

| Name | Value | Nick | Notes |
| --- | --- | --- | --- |
| read | 0 |  | The readable file descriptor 0 |
| write | 1 |  | The writable file descriptor 1 |

## Records

| Name | Parent | Subclasses | Signals | Methods | Notes |
| --- | --- | --- | --- | --- | --- |
| Pipe |  | 0 | 0 | 0 | A Unix pipe. The advantage of this type over `int[2]` is that it can be closed automatically when it goes out of scope, using `g_auto(GUnixPipe)`, ... |

### GLibUnix.Pipe

C type: `GUnixPipe`

A Unix pipe. The advantage of this type over `int[2]` is that it can be closed automatically when it goes out of scope, using `g_auto(GUnixPipe)`, ...

#### Fields

| Field | Type |
| --- | --- |
| fds | gint |

## Functions

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| closefrom | `closefrom(lowfd: gint) -> gint` | g_closefrom |  |  |
| error_quark | `error_quark() -> GLib.Quark` | g_unix_error_quark |  |  |
| fd_add | `fd_add(fd: gint, condition: GLib.IOCondition, function: GLib.UnixFDSourceFunc, user_data: gpointer?) -> guint` | g_unix_fd_add |  |  |
| fd_add_full | `fd_add_full(priority: gint, fd: gint, condition: GLib.IOCondition, function: GLib.UnixFDSourceFunc, user_data: gpointer?, notify: GLib.DestroyNotify) -> guint` | g_unix_fd_add_full |  |  |
| fd_source_new | `fd_source_new(fd: gint, condition: GLib.IOCondition) -> GLib.Source` | g_unix_fd_source_new |  |  |
| fdwalk_set_cloexec | `fdwalk_set_cloexec(lowfd: gint) -> gint` | g_fdwalk_set_cloexec |  |  |
| get_passwd_entry | `get_passwd_entry(user_name: utf8) -> gpointer throws` | g_unix_get_passwd_entry |  |  |
| open_pipe | `open_pipe(fds: gint, flags: gint) -> gboolean throws` | g_unix_open_pipe |  |  |
| set_fd_nonblocking | `set_fd_nonblocking(fd: gint, nonblock: gboolean) -> gboolean throws` | g_unix_set_fd_nonblocking |  |  |
| signal_add | `signal_add(signum: gint, handler: GLib.SourceFunc, user_data: gpointer?) -> guint` | g_unix_signal_add |  |  |
| signal_add_full | `signal_add_full(priority: gint, signum: gint, handler: GLib.SourceFunc, user_data: gpointer?, notify: GLib.DestroyNotify) -> guint` | g_unix_signal_add_full |  |  |
| signal_source_new | `signal_source_new(signum: gint) -> GLib.Source` | g_unix_signal_source_new |  |  |

## Callbacks

| Name | Signature | C symbol | Since | Notes |
| --- | --- | --- | --- | --- |
| FDSourceFunc | `FDSourceFunc(fd: gint, condition: GLib.IOCondition, user_data: gpointer?) -> gboolean` |  |  | The type of functions to be called when a UNIX fd watch source triggers. |

