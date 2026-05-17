/**
 * demo/gdkpixbuf/inspect.nut
 *
 * `file(1)`-style image inspector. Prints declared dimensions and the
 * detected loader for every input file, without fully decoding the image.
 *
 * Usage:
 *     sqgi demo/gdkpixbuf/inspect.nut <image1> [image2 ...]
 *
 *     # No inputs → lists every PixbufFormat the system knows about.
 *     sqgi demo/gdkpixbuf/inspect.nut
 *
 * Exercises:
 *   - Pixbuf.get_formats (PixbufFormat metadata enumeration)
 *   - Pixbuf.get_file_info (dimensions + loader without full decode)
 *   - PixbufFormat properties (name, description, mime types, extensions)
 */

local Pb = import("GdkPixbuf")

if (vargv.len() == 0) {
    local fs = Pb.Pixbuf.get_formats()
    print(format("known loaders: %d\n", fs.len()))
    print(format("%-12s %-32s %-8s\n", "name", "description", "writable"))
    print("------------ -------------------------------- --------\n")
    foreach (f in fs) {
        print(format("%-12s %-32s %s\n",
                     f.get_name(),
                     f.get_description(),
                     f.is_writable().tostring()))
    }
    return
}

foreach (path in vargv) {
    print(path + "\n")
    try {
        local r = Pb.Pixbuf.get_file_info(path)
        if (typeof(r) != "array" || r.len() != 3 || r[0] == null) {
            print("  (no format detected)\n")
            continue
        }
        local fmt = r[0], w = r[1], h = r[2]
        print(format("  format:       %s  (%s)\n",
                     fmt.get_name(), fmt.get_description()))
        print(format("  declared:     %dx%d\n", w, h))
        local mt = fmt.get_mime_types()
        if (typeof(mt) == "array" && mt.len() > 0) {
            print(format("  mime-types:   %s\n", mt.tostring()))
        }
        local ex = fmt.get_extensions()
        if (typeof(ex) == "array" && ex.len() > 0) {
            print(format("  extensions:   %s\n", ex.tostring()))
        }
        print(format("  scalable:     %s\n", fmt.is_scalable().tostring()))
        print(format("  writable:     %s\n", fmt.is_writable().tostring()))
    } catch (e) {
        print("  ERROR: " + e + "\n")
    }
}
