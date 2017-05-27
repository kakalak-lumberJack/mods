-- farming_food recipes
-- by MTDad

-- Peach Cobbler

minetest.register_craftitem("farming_food:peach_cobbler", {
	description = "Peach Cobbler",
	inventory_image = "farming_food_peach_cobbler.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "cooking",
	cooktime = "10",
	output = "farming_food:peach_cobbler",
	recipe = "farming_food:peach_cobbler_raw",
})

minetest.register_craftitem("farming_food:peach_cobbler_raw", {
	description = "Raw Peach Cobbler",
	inventory_image = "farming_food_peach_cobbler_raw.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming_food:peach_cobbler_raw 3",
	recipe = {"group:food_flour", "group:food_sugar", "group:food_egg", "group:food_peach"}
})

-- Corn Bread

minetest.register_craftitem("farming_food:corn_bread", {
	description = "Corn Bread",
	inventory_image = "farming_food_corn_bread.png",
	on_use = minetest.item_eat(4),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming_food:corn_bread",
	recipe = "farming_food:corn_bread_dough",
})

minetest.register_craftitem("farming_food:corn_bread_dough", {
	description = "Corn Bread Dough",
	inventory_image = "farming_food_corn_bread_dough.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "farming_food:corn_bread_dough 3",
	recipe = {"group:food_corn", "group:food_corn", "group:food_milk", "group:food_egg"},
	replacements = {{"animalmaterials:milk", "vessels:drinking_glass"}},
})

-- Strawberry Lemonade

minetest.register_craftitem("farming_food:strawberry_lemonade", {
	description = "Strawberry Lemonade",
	inventory_image = "farming_food_strawberry_lemonade.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "shapeless",
	output = "farming_food:strawberry_lemonade 3",
	recipe = {"group:food_strawberry", "group:food_lemon", "group:food_cup"}
})

-- Chocolate Chip Cookies

minetest.register_craftitem("farming_food:cookie_chocochip", {
	description = "Chocolate Chip Cookie",
	inventory_image = "farming_food_cookie_chocochip.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craftitem("farming_food:cookie_chocochip_dough", {
	description = "Chocolate Chip Cookie Dough",
	inventory_image = "farming_food_cookie_chocochip_dough.png",
	on_use = minetest.item_eat(1),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 2,
	output = "farming_food:cookie_chocochip",
	recipe = "farming_food:cookie_chocochip_dough",
})

minetest.register_craft({
	output = "farming_food:cookie_chocochip_dough 9",
	recipe = {
	{"", "group:food_dark_chocolate", "group:food_butter"},
	{"group:food_flour", "group:food_sugar", "group:food_egg"},
	}
})

-- Strawberry Rhubarb Pie
minetest.register_craftitem("farming_food:pie_cooked", {
	description = "Strawberry Rhubarb Pie",
	inventory_image = "farming_food_pie_cooked.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craftitem("farming_food:pie_raw", {
	description = "Raw Strawberry Rhubarb Pie",
	inventory_image = "farming_food_pie_raw.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming_food:pie_cooked",
	recipe = "farming_food:pie_raw",
})

minetest.register_craft({
	output = "farming_food:pie_raw 3",
	recipe = {
	{"group:food_sugar", "group:food_flour", "group:food_sugar"},
	{"group:food_strawberry", "group:food_rhubarb", "group:food_strawberry"},
	},
})

-- Fritters

-- Walnut
minetest.register_craftitem("farming_food:fritter_walnut", {
	description = "Walnut Fritter",
	inventory_image = "farming_food_fritter_walnut.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craftitem("farming_food:fritter_walnut_dough", {
	description = "Dough for Walnut Fritter",
	inventory_image = "farming_food_fritter_walnut_dough.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming_food:fritter_walnut",
	recipe = "farming_food:fritter_walnut_dough",
})

minetest.register_craft({
	output = "farming_food:fritter_walnut_dough 3",
	recipe = {
	{"", "group:food_egg", ""},
	{"group:food_flour", "group:food_walnut", "group:food_flour"},
	{"", "group:food_sugar", ""},
	},
})

-- Corn
minetest.register_craftitem("farming_food:fritter_corn", {
	description = "Corn Fritter",
	inventory_image = "farming_food_fritter_corn.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craftitem("farming_food:fritter_corn_dough", {
	description = "Dough for Corn Fritter",
	inventory_image = "farming_food_fritter_corn_dough.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming_food:fritter_corn",
	recipe = "farming_food:fritter_corn_dough",
})

minetest.register_craft({
	output = "farming_food:fritter_corn_dough 3",
	recipe = {
	{"", "group:food_egg", ""},
	{"group:food_flour", "group:food_corn", "group:food_flour"},
	{"", "group:food_sugar", ""},
	},
})

-- Apple
minetest.register_craftitem("farming_food:fritter_apple", {
	description = "Apple Fritter",
	inventory_image = "farming_food_fritter_apple.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craftitem("farming_food:fritter_apple_dough", {
	description = "Dough for Apple Fritter",
	inventory_image = "farming_food_fritter_apple_dough.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = "farming_food:fritter_apple",
	recipe = "farming_food:fritter_apple_dough",
})

minetest.register_craft({
	output = "farming_food:fritter_apple_dough 3",
	recipe = {
	{"", "group:food_egg", ""},
	{"group:food_flour", "default:apple", "group:food_flour"},
	{"", "group:food_sugar", ""},
	},
})

minetest.register_alias("farming:cookie", "farming_food:cookie_chocochip")
minetest.register_alias("farming:donut", "farming_food:fritter_corn")
minetest.register_alias("farming:donut_chocolate", "farming_food:fritter_walnut")
minetest.register_alias("farming:donut_apple", "farming_food:fritter_apple")
minetest.register_alias("farming:smoothie_raspberry", "farming_food:strawberry_lemonade")
minetest.register_alias("farming:rhubarb_pie", "farming_food:pie_cooked")
minetest.register_alias("farming:chocolate_dark", "food:dark_chocolate")
