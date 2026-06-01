# 1. Package One Script

This first package has one Squirrel script and no manifest. It is the smallest
way to see what `sqgipkg` does.

## Create A Project

Make a directory with `main.nut`:

```text
hello-sqgi/
  main.nut
```

`main.nut`:

```squirrel
print("hello from packaged SQGI\n")
```

From inside the directory, run:

```sh
sqgipkg
```

On Linux, the default target is an AppImage:

```text
dist-linux-x86_64/hello-sqgi.AppImage
```

Run it:

```sh
APPIMAGE_EXTRACT_AND_RUN=1 dist-linux-x86_64/hello-sqgi.AppImage
```

Expected output:

```text
hello from packaged SQGI
```

`APPIMAGE_EXTRACT_AND_RUN=1` lets the AppImage run on systems where FUSE is not
available or not configured for the current user.

## What Went Into The Package

The package contains:

- the `sqgi` runtime
- SQGI's native libraries
- your script, compiled to `.cnut` by default
- a compatibility `.nut` path so normal imports still work
- a launcher that points SQGI at the packaged app root

You did not name any dependencies yet, so this is best for command-line scripts
or scripts that only use libraries already present on the target system.

## Run A Smoke Test

For small apps, make smoke testing part of the package command:

```sh
sqgipkg --smoke-test ""
```

The empty string means "run the packaged app with no extra arguments." If your
app accepts a quick mode, pass that instead:

```sh
sqgipkg --smoke-test "--check"
```

## Build From The SQGI Source Tree

If SQGI is not installed and you are working from this repository, run:

```sh
build/sqgi tools/sqgipkg --manifest path/to/hello-sqgi/sqgipkg.json
```

For the no-manifest case, run from the project directory:

```sh
/path/to/sqgi/build/sqgi /path/to/sqgi/tools/sqgipkg
```

Next: [add a manifest and package more scripts](02-manifest-and-scripts.md).

