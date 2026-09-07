use glib::prelude::*;
use glib::subclass::prelude::*;
use glib::translate::{from_glib_none, IntoGlib, ToGlibPtr};
use std::cell::Cell;
use std::os::raw::{c_char, c_int};
use std::sync::OnceLock;

mod imp {
    use super::*;

    #[derive(Default)]
    pub struct Counter {
        pub value: Cell<i32>,
    }

    #[glib::object_subclass]
    impl ObjectSubclass for Counter {
        const NAME: &'static str = "SqRustCounter";
        type Type = super::Counter;
        type ParentType = glib::Object;
    }

    impl ObjectImpl for Counter {
        fn signals() -> &'static [glib::subclass::Signal] {
            static SIGNALS: OnceLock<Vec<glib::subclass::Signal>> = OnceLock::new();
            SIGNALS.get_or_init(|| {
                vec![glib::subclass::Signal::builder("changed")
                    .param_types([i32::static_type()])
                    .build()]
            })
        }
    }
}

glib::wrapper! {
    pub struct Counter(ObjectSubclass<imp::Counter>);
}

impl Counter {
    fn new() -> Self {
        glib::Object::builder().build()
    }

    fn add(&self, delta: i32) -> i32 {
        let imp = self.imp();
        let value = imp.value.get() + delta;
        imp.value.set(value);
        self.emit_by_name::<()>("changed", &[&value]);
        value
    }

    fn value(&self) -> i32 {
        self.imp().value.get()
    }

    fn describe(&self) -> String {
        format!("RustCounter<{}>", self.value())
    }
}

type CounterInstance = <imp::Counter as ObjectSubclass>::Instance;

unsafe fn counter_from_ptr(counter: *mut glib::gobject_ffi::GObject) -> Option<Counter> {
    if counter.is_null() {
        None
    } else {
        Some(from_glib_none(counter as *mut CounterInstance))
    }
}

#[no_mangle]
pub extern "C" fn sq_rust_counter_get_type() -> glib::ffi::GType {
    Counter::static_type().into_glib()
}

#[no_mangle]
pub extern "C" fn sq_rust_counter_new() -> *mut glib::gobject_ffi::GObject {
    let counter = Counter::new();
    let ptr: *mut CounterInstance = counter.to_glib_full();
    ptr as *mut glib::gobject_ffi::GObject
}

#[no_mangle]
pub unsafe extern "C" fn sq_rust_counter_add(
    counter: *mut glib::gobject_ffi::GObject,
    delta: c_int,
) -> c_int {
    counter_from_ptr(counter)
        .map(|counter| counter.add(delta))
        .unwrap_or_default()
}

#[no_mangle]
pub unsafe extern "C" fn sq_rust_counter_get_value(
    counter: *mut glib::gobject_ffi::GObject,
) -> c_int {
    counter_from_ptr(counter)
        .map(|counter| counter.value())
        .unwrap_or_default()
}

#[no_mangle]
pub unsafe extern "C" fn sq_rust_counter_describe(
    counter: *mut glib::gobject_ffi::GObject,
) -> *mut c_char {
    counter_from_ptr(counter)
        .map(|counter| counter.describe())
        .unwrap_or_else(|| "RustCounter<invalid>".to_string())
        .to_glib_full()
}
