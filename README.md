# ZDSV Parser

A simple, efficient delimiter-separated values (DSV) parser written in Zig. This parser is designed to handle data formats where values are separated by a specific delimiter (e.g., commas for CSV, tabs for TSV), making it versatile for various data processing tasks.

## Features
- **Custom Delimiter Support**: Easily parse files with any delimiter.
- **Memory Efficient**: Designed with Zig's performance and safety features.
- **Simple API**: Easy to integrate and use in your Zig projects.
- **Error Handling**: Robust error handling for malformed data.

## How to run the example

1. Clone the repository:
    ```sh
    git clone https://github.com/gmcodentech/zdsv.git
    ```
2. Navigate to the project directory:
    ```sh
    cd zdsv
    ```
3. Build the project using Zig:
    ```sh
    zig build
    ```

## Usage

Provide examples of how to use your project. For example:

```zig
const std = @import("std");
const zdsv = @import("zdsv.zig").ZDSV;
pub fn main() !void {
	var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    	defer _ = gpa.deinit();
    	const allocator = gpa.allocator();
	
	const parser = try zdsv(Product).init(allocator);
    	defer parser.deinit();

    	const productList = try parser.get("products.csv", ",", true, 10);
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
```
### Output
```console
1 sugar 34.5 100
2 tea 35.6 1900
3 Milk 56.3 200
4 Water 95.4 100
5 Toothpaste 23.3 90
6 Candy 2.3 1000
7 Soap 10.5 180
8 Curd 144.4 100
9 Rice 15.33 800
10,Bread,19.4,199
```

The 'get' function takes three parameters for filepath, separator character, header present or absent (true/false) and records counts to read

## CSV file data (products.csv)
```text
id,name,price,units
1,sugar,34.5,100
2,tea,35.6,1900
3,Milk,56.3,200
4,Water,95.4,100
5,Toothpaste,23.3,90
6,Candy,2.3,1000
7,Soap,10.5,180
8,Curd,144.4,100
9,Rice,15.33,800
10,Bread,19.4,199

```
