const std = @import("std");
const divExact = std.math.divExact;

pub const ComputationError = error{
    IllegalArgument,
};

pub fn steps(number: usize) anyerror!usize {
    var step: usize = 0;
    var value: usize = number;
    if (number == 0) return ComputationError.IllegalArgument;

    while (true) : (step += 1) {
        if (value == 1) return step;
        if (value % 2 == 0) {
            value = divExact(usize, value, 2) catch unreachable;
        } else {
            value = (3 * value) + 1;
        }
    }
}

const testing = std.testing;
// const ComputationError = ComputationError;
test "zero steps for one" {
    const expected: usize = 0;
    const actual = try steps(1);
    try testing.expectEqual(expected, actual);
}
test "divide if even" {
    const expected: usize = 4;
    const actual = try steps(16);
    try testing.expectEqual(expected, actual);
}
test "even and odd steps" {
    const expected: usize = 9;
    const actual = try steps(12);
    try testing.expectEqual(expected, actual);
}
test "large number of even and odd steps" {
    const expected: usize = 152;
    const actual = try steps(1_000_000);
    try testing.expectEqual(expected, actual);
}
test "zero is an error" {
    const expected = ComputationError.IllegalArgument;
    const actual = steps(0);
    try testing.expectError(expected, actual);
}
