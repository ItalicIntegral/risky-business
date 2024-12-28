const std = @import("std");

// To execute...
// zig run /src/misc/helloWorld.zig
pub fn main() !void {
    std.debug.print("Hello {s}!\n", .{"World"});
}
