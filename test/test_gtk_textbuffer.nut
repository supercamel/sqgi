// test/test_gtk_textbuffer.nut
//
// Regression coverage for caller-allocated GI out records such as GtkTextIter.
// Gtk.TextBuffer.get_start_iter/get_end_iter/get_bounds write full structs into
// caller-provided storage; SQGI must not hand GI a single GIArgument slot.

local Gtk = import("Gtk", "4.0")

function check(cond, msg) {
    if (!cond) throw "[FAIL] " + msg
}

local buf = Gtk.TextBuffer.new(null)
buf.set_text("alpha\nbeta", -1)

local start = buf.get_start_iter()
local end = buf.get_end_iter()
check(typeof start == "instance", "start iter is an instance")
check(typeof end == "instance", "end iter is an instance")
check(start.get_offset() == 0, "start offset")
check(end.get_offset() == buf.get_char_count(), "end offset")

local text = buf.get_text(start, end, false)
check(text == "alpha\nbeta", "full buffer text: " + text)

local bounds = buf.get_bounds()
check(typeof bounds == "array", "get_bounds returns two iters")
check(bounds.len() == 2, "get_bounds arity")
check(buf.get_text(bounds[0], bounds[1], false) == text, "get_bounds text")

local beta = buf.get_iter_at_offset(6)
check(beta.get_offset() == 6, "iter_at_offset")
check(buf.get_text(beta, end, false) == "beta", "iter_at_offset text")

function make_selection_with_temporary_model() {
    return Gtk.NoSelection.new(Gtk.StringList.new(["one", "two"]))
}

local selection = make_selection_with_temporary_model()
check(selection.get_n_items() == 2, "selection with transfer-full temporary model")
selection = null
::collectgarbage()

print("[OK] test_gtk_textbuffer passed\n")
