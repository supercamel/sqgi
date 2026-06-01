// test/test_boxed_record_constructor.nut
//
// Record classes should allocate backing C storage when called as
// constructors. Gdk.RGBA is a small boxed record whose methods and fields make
// that visible without requiring a GTK display.

local Gdk = import("Gdk", "4.0")

function check(name, cond, detail = "") {
    if (!cond) {
        print("[FAIL] " + name + (detail.len() ? " — " + detail : "") + "\n")
        throw name
    }
}

local c = Gdk.RGBA()
check("default red", c.red == 0.0, "" + c.red)
check("default alpha", c.alpha == 0.0, "" + c.alpha)

check("parse named color", c.parse("rebeccapurple"))
check("red channel", fabs(c.red - 0.4) < 0.001, "" + c.red)
check("green channel", fabs(c.green - 0.2) < 0.001, "" + c.green)
check("blue channel", fabs(c.blue - 0.6) < 0.001, "" + c.blue)
check("alpha channel", fabs(c.alpha - 1.0) < 0.001, "" + c.alpha)

check("parse rgba", c.parse("rgba(255, 0, 0, 0.5)"))
check("rgba red", fabs(c.red - 1.0) < 0.001, "" + c.red)
check("rgba alpha", fabs(c.alpha - 0.5) < 0.001, "" + c.alpha)

local d = c.copy()
check("copy returns record", typeof(d) == "instance", typeof(d))
check("copy preserves alpha", fabs(d.alpha - 0.5) < 0.001, "" + d.alpha)

print("[OK] test_boxed_record_constructor passed\n")
