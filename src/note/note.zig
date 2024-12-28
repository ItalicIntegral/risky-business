const std = @import("std");
const debugPrint = std.debug.print;

pub fn sayHelloNote() void {
    debugPrint("Hello from note.zig\n", .{});
}

pub fn newNoteHtml() void {
    debugPrint("Imagine this prints out an html document for user to enter a new note.\n", .{});
}

const Note = struct {
    id: u8 = 13,
    subject: []const u8,
    note: []const u8,

    // const Self = @This();

    pub fn printNoteJson(self: Note) void {
        debugPrint("Note: {s}\n", .{
            std.json.fmt(self, .{
                .whitespace = .indent_2,
            }),
        });
    }
};

pub fn init(subject: []const u8, note: []const u8) Note {
    const counter = struct {
        var val: u8 = 0;
    };
    counter.val += 1;

    return Note{
        .id = counter.val,
        .subject = subject,
        .note = note,
    };
}
