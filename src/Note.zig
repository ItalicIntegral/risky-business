id: u32,
note: []const u8,

pub fn init(id: u32, note: []const u8) Self {
    // std.debug.print("Hello from note.init()\n", .{});
    return Self{
        .id = id,
        .note = note,
    };
}

const std = @import("std");
const Self = @This();
