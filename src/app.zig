const std = @import("std");
const print = std.debug.print;

const Note = @import("./Note.zig");
const location = @import("./location.zig");

pub fn init() anyerror!void {
    try testNotes();

    // This is all a test. Make it so.
    // var locations = std.ArrayList(location.Location).init(allocator);
    // defer locations.deinit();

    // try locations.append(location.Location.init("1", "Calgary"));
    // try locations.append(location.Location.init("2", "Edmonton"));
    // try locations.append(location.Location.init("3", "Winnipeg"));
    // std.debug.print("{any}\n", .{locations});

    // if (location.Location.init("88888888", "Some office")) |result| {
    //     std.debug.print("result - id: {d}, location: {s}\n", .{ result.id, result.location });
    //     try locations.append(result);
    //     // std.debug.print("{any}\n", .{locations});
    // } else |err| {
    //     std.debug.print("Error. {}\n", .{err});
    // }

    // var list = std.ArrayList(i32).init(std.testing.allocator);
    // defer list.deinit(); // Try commenting this out and see if zig detects the memory leak!
    // try list.append(42);
    // try std.testing.expectEqual(@as(i32, 42), list.pop());

    // location.init();
    // const l = location.Location.init(34, "The Office") catch |err| {
    //     if (err == LocationError.LocationNameTooLong) {
    //         std.debug.print("Error. Name too long.\n", .{});
    //     }
    // };
    // std.debug.print("New Location id: {}, location: {s}\n", .{ l.id, l.location });

    const l = location.Location{
        .id = 45,
        .location = "Head Office",
    };
    std.debug.print(
        "New Location id: {}, location: {s}\n",
        .{ l.id, l.location },
    );

    // location.sayHello();
    // std.debug.print("Hello from app.init()\n", .{});
}

fn testNotes() !void {
    std.debug.print("hello world\n", .{});
    const my_note = Note.init(12, "foobar");
    print("my_note id {d}, note: {s}\n", .{ my_note.id, my_note.note });

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var notes = std.ArrayList(Note).init(allocator);
    defer notes.deinit();
    try notes.append(Note.init(1234, "My 1234 note."));
    try notes.append(Note.init(5567, "My 5567 note."));
    try notes.append(Note.init(9876, "My 9876 note."));
    try notes.append(Note.init(5454, "My 5454 note."));
    std.debug.print("{?}\n", .{notes});
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // Try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
