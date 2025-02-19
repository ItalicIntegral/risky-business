const std = @import("std");
const print = std.debug.print;

// const Note = @import("Note/Note.zig");
// const heap = std.heap;
// const Sieve = @import("./prime.zig").Sieve;
// const SaleDetail = @import("saleDetail.zig");
// const SaleHeader = @import("saleHeader.zig");

// const app = @import("./app.zig");

pub fn main() !void {

    // try app.init();

    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    print("All your {s} are belong to us.\n", .{"codebase"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    // const stdout_file = std.io.getStdOut().writer();
    // var bw = std.io.bufferedWriter(stdout_file);
    // const stdout = bw.writer();

    // try stdout.print("Run `zig build test` to run the tests.\n", .{});

    // try bw.flush(); // Don't forget to flush!
}

// // Create a custom arena allocator
// var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator).allocator();
// defer arena.deinit();

// // Allocate some memory using the arena allocator
// const data = try arena.alloc(u8, 10);
// defer arena.free(data);

// // Use the allocated memory
// for (data, 0..) |*byte, i| {
//     print("byte: {any}\n", .{byte});
//     print("i: {any}\n", .{i});
//     // byte.* = @intCast(u8, i);
// }

// Print the contents of the allocated memory
// std.debug.print("Data: {any}\n", .{data});

// const note1 = Note.init("This is my subject", "This is my note body");
// note1.print_formatted_json();
// Note.new_note_form();
// note1.edit_note_form();

// var sieve = try Sieve(u64).init(&allocator.allocator, size);
// sieve.run();
// sieve.deinit();

// SaleDetail.sayHello();
// const saleDetail = SaleDetail.init(
//     13,
//     1,
//     1000,
//     500,
//     "moi",
// );
// std.debug.print("saleDetail: {any}\n", .{saleDetail});

// SaleHeader.sayHello();
// const saleHeader = SaleHeader.init(
//     13,
//     3,
//     600,
//     300,
//     "toi",
// );
// std.debug.print("saleHeader: {any}\n", .{saleHeader});

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // Try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
