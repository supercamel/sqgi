#!/usr/bin/env python3
"""Run acceptance commands with selected producer trees unreadable (Linux).

This uses Landlock because unprivileged mount namespaces may be disabled. Rules
are inherited by every child, including Gradle daemons. Host tools must first
be installed outside the denied trees. This helper is not a general sandbox.
"""
import argparse
import ctypes
import os
from pathlib import Path
import sys


def restrict(denied):
    if os.uname().machine != 'x86_64':
        raise RuntimeError('This acceptance helper uses Linux x86-64 syscall numbers')
    libc = ctypes.CDLL(None, use_errno=True)
    def checked(result):
        if result < 0:
            raise OSError(ctypes.get_errno(), os.strerror(ctypes.get_errno()))
        return result
    abi = checked(libc.syscall(444, 0, 0, 1))
    if abi < 2:
        raise RuntimeError('Landlock ABI 2 is required to prove producer isolation with directory promotion')
    # Restrict execute/read-file/read-directory. Other rights keep their normal
    # host permissions; this check specifically proves absence of source reads.
    # REFER is implicitly denied even if absent from handled_access_fs. Allow
    # reparenting within readable trees so atomic cache-directory promotion is
    # exercised normally. It cannot grant reads into a denied tree.
    refer = 1 << 13
    access = (1 << 0) | (1 << 2) | (1 << 3) | refer
    mask = ctypes.c_uint64(access)
    ruleset = checked(libc.syscall(444, ctypes.byref(mask), ctypes.sizeof(mask), 0))
    class Rule(ctypes.Structure):
        _pack_ = 1
        _fields_ = [('allowed_access', ctypes.c_uint64), ('parent_fd', ctypes.c_int32)]
    def allow(path):
        if path in denied:
            return
        if any(d.is_relative_to(path) for d in denied):
            for child in path.iterdir():
                if not child.is_symlink():
                    allow(child)
            return
        fd = os.open(path, getattr(os, 'O_PATH', 0o10000000) | os.O_CLOEXEC)
        try:
            rule = Rule(access if path.is_dir() else access & ~((1 << 3) | refer), fd)
            checked(libc.syscall(445, ruleset, 1, ctypes.byref(rule), 0))
        finally:
            os.close(fd)
    try:
        allow(Path('/'))
        checked(libc.prctl(38, 1, 0, 0, 0))  # PR_SET_NO_NEW_PRIVS
        checked(libc.syscall(446, ruleset, 0))
    finally:
        os.close(ruleset)
    for path in denied:
        try:
            if path.is_dir():
                list(path.iterdir())
            else:
                with path.open('rb') as stream:
                    stream.read(1)
        except PermissionError:
            print('Verified unreadable input: ' + str(path), file=sys.stderr, flush=True)
        else:
            raise RuntimeError('Producer isolation did not apply: ' + str(path))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--deny', type=Path, action='append', required=True)
    parser.add_argument('command', nargs=argparse.REMAINDER)
    args = parser.parse_args()
    denied = {p.resolve(strict=True) for p in args.deny}
    command = args.command[1:] if args.command[:1] == ['--'] else args.command
    if not command:
        parser.error('Provide a command after --')
    restrict(denied)
    os.execvp(command[0], command)


if __name__ == '__main__':
    main()
