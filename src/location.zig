const std = @import("std");
const print = std.debug.print;

const MAX_STRING_LENGTH = 32;

pub const LocationError = error{
    InvalidCharacter,
    LocationNameTooLong,
    MissingLocationName,
    Overflow,
};

pub const Location = struct {
    id: u32,
    location: []const u8,

    pub fn init(id_value: []const u8, location_value: []const u8) LocationError!Location {
        const id = try parseUnsigned32value(id_value);
        const location = try parse16charMaxValue(location_value);

        return Location{
            .id = id,
            .location = location,
        };
    }
};

pub fn parseUnsigned32value(value: []const u8) LocationError!u32 {
    return try std.fmt.parseUnsigned(
        u32,
        std.mem.trim(u8, value, " "),
        10,
    );
}

pub fn parse16charMaxValue(location_value: []const u8) LocationError![]const u8 {
    const trimmed_location = std.mem.trim(u8, location_value, " ");
    if (std.mem.eql(u8, trimmed_location, "")) {
        return LocationError.MissingLocationName;
    }
    if (trimmed_location.len > MAX_STRING_LENGTH) {
        return LocationError.LocationNameTooLong;
    }
    return trimmed_location;
}

pub fn init() void {
    createExampleLocations();
}

fn createExampleLocations() void {
    std.debug.print("Hello from location.createExampleLocations()\n", .{});
}

test "init" {
    try std.testing.expectError(
        LocationError.InvalidCharacter,
        Location.init(" ", "Location Id Missing"),
    );

    try std.testing.expectError(
        LocationError.MissingLocationName,
        Location.init("1", " "),
    );

    try std.testing.expectEqual(
        Location{ .id = 0, .location = "Location 0" },
        Location.init("0", "Location 0"),
    );

    if (Location.init(" 99 ", " This location name is very long. ")) |locn| {
        try std.testing.expectEqual(@as(u32, 99), locn.id);
        try std.testing.expectEqualStrings(
            "This location name is very long.",
            locn.location,
        );
    } else |err| return err;

    try std.testing.expectEqual(
        Location{ .id = 4_294_967_295, .location = "Loc: 4294967295" },
        Location.init("4_294_967_295", "Loc: 4294967295"),
    );
    try std.testing.expectError(
        error.Overflow,
        Location.init("4_294_967_296", "Loc: 4294967296"),
    );

    try std.testing.expectError(
        LocationError.LocationNameTooLong,
        Location.init(" 999 ", " This location name is toooo long. "),
    );

    try std.testing.expectError(
        error.InvalidCharacter,
        Location.init("-1", "Location -1"),
    );

    try std.testing.expectError(
        error.InvalidCharacter,
        Location.init("f", "Location f"),
    );
}

test "parse16charMaxValue" {
    try std.testing.expectError(
        LocationError.MissingLocationName,
        parse16charMaxValue(""),
    );
    try std.testing.expectError(
        LocationError.MissingLocationName,
        parse16charMaxValue(" "),
    );
    try std.testing.expectEqualStrings(
        "Home Office",
        try parse16charMaxValue("Home Office"),
    );
    try std.testing.expectEqualStrings(
        "Home Office",
        try parse16charMaxValue(" Home Office "),
    );
    try std.testing.expectEqualStrings(
        "This location name is very long.",
        try parse16charMaxValue("This location name is very long."),
    );
    try std.testing.expectError(
        LocationError.LocationNameTooLong,
        parse16charMaxValue("This location name is toooo long."),
    );
}

test "parseUnsigned32value" {
    try std.testing.expectError(
        error.InvalidCharacter,
        parseUnsigned32value(""),
    );
    try std.testing.expectEqual(
        @as(u32, 0),
        parseUnsigned32value("000_000"),
    );
    try std.testing.expectEqual(
        @as(u32, 4_294_967_295),
        parseUnsigned32value("4_294_967_295"),
    );
    try std.testing.expectError(
        error.Overflow,
        parseUnsigned32value("4_294_967_296"),
    );
    try std.testing.expectError(
        error.InvalidCharacter,
        parseUnsigned32value("-1"),
    );
    try std.testing.expectError(
        error.InvalidCharacter,
        parseUnsigned32value("f"),
    );
}
