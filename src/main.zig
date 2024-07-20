const std = @import("std");
const zdsv = @import("zdsv.zig").ZDSV;
pub fn main() !void {

	var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();
	
	const ltoc = try zdsv(Product).init(allocator);
    defer ltoc.deinit();

    const productList = try ltoc.get("products.csv", ",", true, 10);
	for(productList.items) |item|{
		std.debug.print("{d} {s} {d} {d}\n",.{item.id,item.name,item.price,item.units});
	}
}

const Product = struct{
	id:i32,
	name:[]const u8,
	price:f32,
	units:u32
};