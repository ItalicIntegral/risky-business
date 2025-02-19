const std = @import("std");
const print = std.debug.print;

const Self = @This();

id: u8 = 13,
subject: []const u8,
body: []const u8,

pub fn init(subject: []const u8, body: []const u8) Self {
    const counter = struct {
        var val: u8 = 0;
    };
    counter.val += 1;

    return Self{
        .id = counter.val,
        .subject = subject,
        .body = body,
    };
}

pub fn print_formatted_json(self: Self) void {
    print("Note formatted JSON.\n{s}\n", .{
        std.json.fmt(self, .{
            .whitespace = .indent_2,
        }),
    });
}

pub fn new_note_form() void {
    const new_note_form_template =
        \\<form>
        \\ <label for="subject">Subject:</label>
        \\ <input type="text" id="subject" name="subject" required>
        \\ <label for="body">Body:</label>
        \\ <input type="text" id="body" name="body" required>
        \\</form>
    ;
    print("{s}\n", .{new_note_form_template});
}

pub fn edit_note_form(self: Self) void {
    const edit_note_form_template =
        \\<form id="edit-note-form">
        \\ <label for="id">id:</label>
        \\ <input type="text" id="id" name="id" value="{}" required>
        \\ <label for="subject">subject:</label>
        \\ <input type="text" id="subject" name="subject" value="{s}" required>
        \\ <label for="body">body:</label>
        \\ <input type="text" id="body" name="body" value="{s}" required>
        \\</form>
        \\
    ;
    print(edit_note_form_template, .{ self.id, self.subject, self.body });
    print("\n", .{});
}

test "test init" {
    const note_subject = "Note subject";
    const note_body = "Note body";
    const note = Self.init(note_subject, note_body);
    try std.testing.expectEqualStrings(note_subject, note.subject);
    try std.testing.expectEqualStrings(note_body, note.body);
}

// pub fn newNoteHtml() void {
//     debugPrint("Imagine this prints out an html document for user to enter a new note.\n", .{});
// }

// pub const Note = struct {
//     id: u8 = 13,
//     subject: []const u8,
//     note: []const u8,

//     // const Self = @This();

// };
