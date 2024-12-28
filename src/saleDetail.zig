const std = @import("std");
// const Allocator = std.mem.Allocator;

const Self = @This();

id: i64,

units: i64,
unitPrice: i64,
unitCost: i64,

createdBy: []const u8,

pub fn sayHello() void {
    std.debug.print("saleDetail.sayHello\n", .{});
}

pub fn init(
    id: i64,
    units: i64,
    unitPrice: i64,
    unitCost: i64,
    createdBy: []const u8,
) Self {
    return Self{
        .id = id,
        .units = units,
        .unitPrice = unitPrice,
        .unitCost = unitCost,
        .createdBy = createdBy,
    };
}

test "test saleDetail" {
    try std.testing.expectEqual(
        Self{
            .id = 1,
            .units = 2,
            .unitPrice = 4,
            .unitCost = 3,
            .createdBy = "Brant",
        },
        Self.init(
            1,
            2,
            4,
            3,
            "Brant",
        ),
    );
}

// pub fn parseSaleDetail(id_str: []const u8, units_str: []const u8, unitCost_str: []const u8) !Self {
//     const id = try std.fmt.parseInt(
//         i64,
//         std.mem.trim(u8, id_str, " "),
//         10,
//     );
//     const units = try std.fmt.parseInt(
//         i64,
//         std.mem.trim(u8, units_str, " "),
//         10,
//     );
//     const unitCost = try std.fmt.parseInt(
//         i64,
//         std.mem.trim(u8, unitCost_str, " "),
//         10,
//     );
//     return Self{
//         .id = id,
//         .units = units,
//         .unitCost = unitCost,
//     };

//     // return Self.init(id, units, unitCost);
// }

// pub fn parseUnsigned32value(value: []const u8) LocationError!u32 {
//     return try std.fmt.parseUnsigned(
//         u32,
//         std.mem.trim(u8, value, " "),
//         10,
//     );
// }

// test "test parse saleDetail" {
//     try std.testing.expectEqual(
//         Self{ .id = 12, .units = 54, .unitPrice = 65, .unitCost = 23 },
//         Self.parseSaleDetail("12", "54", "23"),
//     );
// }

// pub const SaleDetail = struct {
//     id: u64,

//     pub fn init(id: u64) SaleDetail {
//         return SaleDetail{
//             .id = id,
//         };
//     }
// };

// pub fn SaleDetail() type {
//     return struct {
//         id: u64,

//         const Self = @This();

//         // pub fn init(allocator: *Allocator, size: usize) !Self {
//         //     var self = Self{
//         //         .sieveSize = size,
//         //         .bits = try ArrayList(u8).initCapacity(allocator, size),
//         //     };
//         //     try self.bits.appendNTimes(0, size);
//         //     return self;
//         // }
//         pub fn init(id: u64) !Self {
//             const self = Self{
//                 .id = id,
//             };
//             return self;
//         }
//     };
// }
