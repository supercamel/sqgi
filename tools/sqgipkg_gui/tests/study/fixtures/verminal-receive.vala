// Compile with the isolated Verminal src/{transports,terminal_utils}.vala files.
// Verifies deferred payload ownership without relying on allocator timing.
class ReceiveProbe : Verminal.Transport {
    public override bool open (Verminal.ConnectionConfig config, out string error) {
        error = "unused"; return false;
    }
    public override bool send (uint8[] bytes, out string error) {
        error = "unused"; return false;
    }
    public override void close () {}
    public void enqueue (uint8[] bytes) { emit_received_main (bytes); }
}

int main () {
    var probe = new ReceiveProbe ();
    bool received = false, correct = false;
    probe.received.connect ((bytes) => {
        received = true;
        correct = bytes.length == 4 && bytes[0] == 0 && bytes[1] == 1 &&
                  bytes[2] == 65 && bytes[3] == 255;
        stdout.printf ("RECEIVED");
        foreach (uint8 value in bytes) stdout.printf (" %02X", value);
        stdout.printf ("\n");
    });
    uint8[] original = {0, 1, 65, 255};
    probe.enqueue (original);
    for (int i = 0; i < original.length; i++) original[i] = 0x7e;
    while (MainContext.default ().pending ()) MainContext.default ().iteration (false);
    if (!received || !correct) {
        stderr.printf ("FAIL deferred receive must retain original bytes\n");
        return 1;
    }
    stdout.printf ("PASS deferred receive retains original bytes\n");
    return 0;
}
