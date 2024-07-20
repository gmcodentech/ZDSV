# ZDSV Parser

A delimiter separated values (DSV) parser written in zig for zig language. It is a simple parser that handles various sparators such as comma(,), hash(#), tabs, etc.

## Features

- Generic
- Fast
- Memory Safe

## Installation

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
```

The 'get' function takes three parameters for filepath, separator character, header present or absent (true/false) and records counts to read

## CSV file data
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
