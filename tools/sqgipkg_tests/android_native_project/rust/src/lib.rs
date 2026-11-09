#[link(name = "sqmobile-1.0")]
extern "C" {
    fn sq_mobile_sum(a: i32, b: i32) -> i32;
}

#[no_mangle]
pub extern "C" fn sq_mobile_rust_sum(a: i32, b: i32) -> i32 {
    unsafe { sq_mobile_sum(a, b) }
}

#[no_mangle]
pub extern "C" fn sq_mobile_rust_width() -> u32 {
    std::mem::size_of::<usize>() as u32
}
