const std = @import("std");
const sqrt = std.math.sqrt;

pub fn squareRoot(radicand: usize) usize {
    return sqrt(radicand);
}

const testing = std.testing;
test "root of 1" {
    const expected: usize = 1;
    const actual = squareRoot(1);
    try testing.expectEqual(expected, actual);
}
test "root of 4" {
    const expected: usize = 2;
    const actual = squareRoot(4);
    try testing.expectEqual(expected, actual);
}
test "root of 25" {
    const expected: usize = 5;
    const actual = squareRoot(25);
    try testing.expectEqual(expected, actual);
}
test "root of 81" {
    const expected: usize = 9;
    const actual = squareRoot(81);
    try testing.expectEqual(expected, actual);
}
test "root of 196" {
    const expected: usize = 14;
    const actual = squareRoot(196);
    try testing.expectEqual(expected, actual);
}
test "root of 65025" {
    const expected: usize = 255;
    const actual = squareRoot(65025);
    try testing.expectEqual(expected, actual);
}
