//! By convention, main.zig is where your main function lives in the case that
//! you are building an executable. If you are making a library, the convention
//! is to delete this file and start with root.zig instead.
const std = @import("std");
// const heap = std.heap;

// const Sieve = @import("./prime.zig").Sieve;
const SaleDetail = @import("saleDetail.zig");
const SaleHeader = @import("saleHeader.zig");

// const app = @import("./app.zig");

pub fn main() !void {
    // var allocator = heap.ArenaAllocator.init(heap.page_allocator);
    // defer allocator.deinit();

    // var sieve = try Sieve(u64).init(&allocator.allocator, size);
    // sieve.run();
    // sieve.deinit();

    SaleDetail.sayHello();
    const saleDetail = SaleDetail.init(
        13,
        1,
        1000,
        500,
        "moi",
    );
    std.debug.print("saleDetail: {any}\n", .{saleDetail});

    SaleHeader.sayHello();
    const saleHeader = SaleHeader.init(
        13,
        3,
        600,
        300,
        "toi",
    );
    std.debug.print("saleHeader: {any}\n", .{saleHeader});

    // try app.init();

    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)
    std.debug.print("All your {s} are belong to us.\n", .{"codebase"});

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    // const stdout_file = std.io.getStdOut().writer();
    // var bw = std.io.bufferedWriter(stdout_file);
    // const stdout = bw.writer();

    // try stdout.print("Run `zig build test` to run the tests.\n", .{});

    // try bw.flush(); // Don't forget to flush!
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // Try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}

// test "fuzz example" {
//     const global = struct {
//         fn testOne(input: []const u8) anyerror!void {
//             // Try passing `--fuzz` to `zig build test` and see if it manages to fail this test case!
//             try std.testing.expect(!std.mem.eql(u8, "canyoufindme", input));
//         }
//     };
//     try std.testing.fuzz(global.testOne, .{});
// }
