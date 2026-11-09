namespace SqMobileVala {
    public class Worker : Object {
        public string label { get; set; default = "vala"; }
        public signal void progressed(int value);
        public Worker(string label) { Object(label: label); }
        public async int sum_async(int a, int b) throws Error {
            Idle.add(sum_async.callback);
            yield;
            if (a < 0) throw new IOError.FAILED("planned Vala error");
            int answer = SqMobile.sum(a, b);
            progressed(answer);
            return answer;
        }
    }
}
