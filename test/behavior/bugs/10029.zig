const std = @import("std");

fn return_first_capture() i32 {
    comptime var closures: [2]fn () i32 = undefined;
    inline for (.{ 12, -22 }) |n, i| {
        closures[i] = struct {
            fn closure() i32 {
                return n;
            }
        }.closure;
    }
    return closures[0]();
}

test "closure capture of inline for variables" {
    const t = std.testing;
    try t.expectEqual(return_first_capture(), 12);
}
