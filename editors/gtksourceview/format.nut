// Shared GtkSourceView adapter. argv names an executable and optional arguments;
// it is passed directly to Gio.Subprocess, never through a shell.
local Gio = import("Gio")

async function format_buffer(buffer, argv, tab_size = 4, insert_spaces = true) {
    local before = buffer.get_text(buffer.get_start_iter(), buffer.get_end_iter(), true)
    local command = clone argv
    command.append("--indent")
    command.append(tab_size.tostring())
    if (!insert_spaces) command.append("--tabs")
    local child = Gio.Subprocess.new(command,
        Gio.SubprocessFlags.stdin_pipe | Gio.SubprocessFlags.stdout_pipe | Gio.SubprocessFlags.stderr_pipe)
    local result = await child.communicate_utf8_async(before, null)
    if (!child.get_successful()) throw "sqgifmt: " + result[1]
    local current = buffer.get_text(buffer.get_start_iter(), buffer.get_end_iter(), true)
    if (current != before) throw "Buffer changed while formatting; result discarded"
    if (result[0] != before) {
        local cursor = buffer.get_iter_at_mark(buffer.get_insert()).get_offset()
        buffer.begin_user_action()
        // Delete/insert supports one undo action in GtkSourceView.
        buffer.delete(buffer.get_start_iter(), buffer.get_end_iter())
        buffer.insert(buffer.get_start_iter(), result[0], -1)
        buffer.place_cursor(buffer.get_iter_at_offset(cursor < buffer.get_char_count() ? cursor : buffer.get_char_count()))
        buffer.end_user_action()
    }
    return result[0] != before
}
return { format_buffer = format_buffer }
