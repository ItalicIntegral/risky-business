const std = @import("std");
// const Allocator = std.mem.Allocator;

const SaleDetail = @import("saleDetail.zig");

const Self = @This();

id: i64,

totalLines: i64,
totalRevenue: i64,
totalCost: i64,
// margin: i64,

// saleDetails: []SaleDetail,

createdBy: []const u8,

pub fn sayHello() void {
    std.debug.print("saleHeader.sayHello\n", .{});
}

pub fn init(
    id: i64,
    totalLines: i64,
    totalRevenue: i64,
    totalCost: i64,
    // saleDetails: []SaleDetail,
    createdBy: []const u8,
) Self {
    return Self{
        .id = id,
        .totalLines = totalLines,
        .totalRevenue = totalRevenue,
        .totalCost = totalCost,
        // .margin = getMargin(totalRevenue, totalCost),
        // .saleDetails = saleDetails,
        .createdBy = createdBy,
    };
}

pub fn getMargin(revenue: i64, cost: i64) i64 {
    return revenue - cost;
}

test "test saleHeader" {
    try std.testing.expectEqual(
        Self{
            .id = 1,
            .totalLines = 2,
            .totalRevenue = 4,
            .totalCost = 3,
            // .margin = 1,
            // .saleDetails = sale_details,
            .createdBy = "someone",
        },
        Self.init(
            1,
            2,
            4,
            3,
            // sale_details,
            "someone",
        ),
    );
}

// const sale_details = [_]SaleDetail{
//     SaleDetail{ .id = 23, .units = 56, .unitPrice = 99, .unitCost = 77, .createdBy = "foobar" },
//     SaleDetail{ .id = 24, .units = 57, .unitPrice = 100, .unitCost = 78, .createdBy = "foobar2" },
// };
// std.debug.print("sale_details: {any}\n", .{sale_details});

// var list = std.ArrayList(i32).init(std.testing.allocator);
// defer list.deinit(); // Try commenting this out and see if zig detects the memory leak!
// try list.append(42);
// try std.testing.expectEqual(@as(i32, 42), list.pop());

// var list = std.ArrayList(i32).init(std.testing.allocator);
// defer list.deinit(); // Try commenting this out and see if zig detects the memory leak!
// try list.append(36);
// try list.append(42);
// try std.testing.expectEqual(@as(i32, 42), list.pop());
// try std.testing.expectEqual(@as(i32, 36), list.pop());

// array concatenation works if the values are known
// at compile time
// const part_one = [_]i32{ 1, 2, 3, 4 };
// const part_two = [_]i32{ 5, 6, 7, 8 };
// const all_of_it = part_one ++ part_two;
// comptime {
//     std.testing.assert(std.mem.eql(
//         i32,
//         &all_of_it,
//         &[_]i32{ 1, 2, 3, 4, 5, 6, 7, 8 },
//     ));
// }
