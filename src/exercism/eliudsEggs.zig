const std = @import("std");
const debugPrint = std.debug.print;

//
// This is not an optimal solution.
// See builtin @popcount
// https://ziglang.org/documentation/master/#popCount
pub fn eggCount(number: usize) usize {
    // debugPrint("number in binary: {b}\n", .{number});

    var buffer: [1000]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const allocator = fba.allocator();

    var memory = allocator.alloc(u8, 100) catch "";
    defer allocator.free(memory);
    memory = std.fmt.allocPrint(
        allocator,
        "{b}",
        .{number},
    ) catch "";
    // debugPrint("number in binary: {s}\n", .{memory});

    var count: usize = 0;
    for (memory) |c| {
        count += if (c == '1') 1 else 0;
    }
    return count;
}

const testing = std.testing;
test "0 eggs" {
    const expected: usize = 0;
    const actual = eggCount(0);
    try testing.expectEqual(expected, actual);
}
test "1 egg" {
    const expected: usize = 1;
    const actual = eggCount(16);
    try testing.expectEqual(expected, actual);
}
test "4 eggs" {
    const expected: usize = 4;
    const actual = eggCount(89);
    try testing.expectEqual(expected, actual);
}
test "13 eggs" {
    const expected: usize = 13;
    const actual = eggCount(2000000000);
    try testing.expectEqual(expected, actual);
}
