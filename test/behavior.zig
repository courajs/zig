const builtin = @import("builtin");

test {
    _ = @import("behavior/aaron.zig");
}

// (cd build; make install) && zig build test-behavior -Dskip-release -Dskip-non-native -Dskip-libc -Dskip-run-translated-c -Dstage1
// zig build test-behavior -Dskip-release -Dskip-non-native -Dskip-libc -Dskip-run-translated-c -Dstage1
//
// zig build -Domit-stage2 -Dlog
