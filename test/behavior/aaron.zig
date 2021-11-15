const std = @import("std");
const mem = std.mem;

pub const FullValue = union(enum) {
    const Self = @This();
    pub const Blob = struct {
        bytes: []const u8,
    };
    pub const Sum = struct {
        variant: u32,
        inner: *const FullValue,
    };
    pub const Product = struct {
        fields: []const FullValue,
    };

    blob: Blob,
    sum: Sum,
    product: Product,

    pub const nil: Self = Self{ .product = .{ .fields = &[_]Self{} } };
};

pub fn uint_to_full(comptime T: type, val: T, alloc: *std.mem.Allocator) !FullValue {
    var buf: [@sizeOf(T)]u8 = undefined;
    std.mem.writeIntBig(T, &buf, val);
    var bytes = try alloc.dupe(u8, buf[0..]);
    std.log.err("duped:{any}", .{bytes});
    return FullValue{ .blob = .{ .bytes = bytes } };
}

const full_true: FullValue = FullValue{ .sum = .{ .variant = 0, .inner = &FullValue.nil } };
const full_false: FullValue = FullValue{ .sum = .{ .variant = 1, .inner = &FullValue.nil } };

pub fn bridge() type {
    return struct {
        pub fn t_to_full(comptime T: type, val: *const T, alloc: *std.mem.Allocator) !FullValue {
            std.log.err("aaron to full", .{});
            switch (@typeInfo(T)) {
                .Int => {
                    std.log.err("aaron int", .{});
                    return try uint_to_full(T, val.*, alloc);
                },
                .Union => |u| {
                    const Tag = u.tag_type.?;
                    inline for (@typeInfo(Tag).Enum.fields) |f, i| {
                        var eq = @enumToInt(@as(Tag, val.*)) == f.value;
                        if (eq) {
                            std.log.err("start of inline for -> if", .{});
                            const field = u.fields[i];
                            const Inner = field.field_type;
                            var inner = try alloc.create(FullValue);
                            std.log.err("a2 val:{} field:{} field.name:{s} Inner:{}", .{ val, field, field.name, Inner });
                            std.log.err("a22 field_val:{}", .{@field(val, field.name)});
                            var thing = try t_to_full(Inner, &@field(val, field.name), alloc);
                            inner.* = thing;
                            return FullValue{ .sum = .{ .variant = i, .inner = inner } };
                        }
                    }
                },
                else => unreachable,
            }
            return FullValue.nil;
        }
    };
}

test "Union to_full" {
    const U = union(enum) {
        a: bool,
        b: u32,
    };
    const u = U{ .b = 12 };
    const Bridge = bridge();
    _ = try Bridge.t_to_full(U, &u, std.testing.allocator);
}
