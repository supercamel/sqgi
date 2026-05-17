/**
 * demo/gtk4/textbuffer_iters.nut
 *
 * Headless Gtk.TextBuffer/TextIter demo. This intentionally avoids creating a
 * window so it can double as a quick smoke test on machines without a display.
 */

local Gtk = import("Gtk", "4.0")

local buf = Gtk.TextBuffer.new(null)
buf.set_text("SQGI TextBuffer demo\nsecond line", -1)

local start = buf.get_start_iter()
local end = buf.get_end_iter()
local text = buf.get_text(start, end, false)

print("chars: " + buf.get_char_count() + "\n")
print("start offset: " + start.get_offset() + "\n")
print("end offset: " + end.get_offset() + "\n")
print("text:\n" + text + "\n")

local bounds = buf.get_bounds()
print("bounds text matches: " + (buf.get_text(bounds[0], bounds[1], false) == text) + "\n")
