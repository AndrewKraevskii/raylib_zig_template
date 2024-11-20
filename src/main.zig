// BINDINGS ================================================================

extern fn InitWindow(width: c_int, height: c_int, title: [*:0]const u8) void;
extern fn CloseWindow() void;
extern fn WindowShouldClose() bool;
const Color = extern struct {
    r: u8,
    g: u8,
    b: u8,
    a: u8,

    const raywhite: Color = .{ .r = 245, .b = 245, .g = 245, .a = 255 };
    const black: Color = .{ .r = 0, .b = 0, .g = 0, .a = 255 };
};
extern fn ClearBackground(color: Color) void;
extern fn BeginDrawing() void;
extern fn EndDrawing() void;
extern fn DrawText(
    text: [*:0]const u8,
    posX: c_int,
    posY: c_int,
    fontSize: c_int,
    color: Color,
) void;
extern fn MeasureText(text: [*:0]const u8, fontSize: c_int) c_int;

// ACTUAL CODE

pub fn main() void {
    const height = 480;
    const width = 640;
    InitWindow(width, height, "Raylib window");
    defer CloseWindow();

    while (!WindowShouldClose()) {
        BeginDrawing();
        defer EndDrawing();
        ClearBackground(.raywhite);

        const text = "Hello from zig";
        const font_size = 30;

        const text_size = MeasureText(text, font_size);
        DrawText(
            text,
            @divFloor(width - text_size, 2),
            @divFloor(height - font_size, 2),
            font_size,
            .black,
        );
    }
}
