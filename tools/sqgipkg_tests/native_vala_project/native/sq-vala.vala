namespace SqVala {
    public int triple(int value) {
        return value * 3;
    }

    public class Worker : Object {
        public string label { get; set; default = "worker"; }

        public signal void progressed(int step, string message);

        public Worker(string label) {
            Object(label: label);
        }

        public int multiply(int a, int b) {
            return a * b;
        }

        public string describe() {
            return "Worker<%s>".printf(label);
        }

        public void emit_progress(int step) {
            progressed(step, "%s:%d".printf(label, step));
        }

        public async string greet_async(string name, Cancellable? cancellable = null) throws Error {
            Idle.add(greet_async.callback);
            yield;

            if (cancellable != null && cancellable.is_cancelled())
                throw new IOError.CANCELLED("cancelled");

            progressed(1, "greeted " + name);
            return "%s greets %s".printf(label, name);
        }

        public async int delayed_sum_async(int a, int b, Cancellable? cancellable = null) throws Error {
            Timeout.add(10, delayed_sum_async.callback);
            yield;

            if (cancellable != null && cancellable.is_cancelled())
                throw new IOError.CANCELLED("cancelled");

            progressed(2, "summed");
            return a + b;
        }

        public async string fail_async() throws Error {
            Idle.add(fail_async.callback);
            yield;

            throw new IOError.FAILED("planned Vala failure");
        }
    }
}
