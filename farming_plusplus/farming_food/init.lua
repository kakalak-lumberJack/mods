-- farming_food
-- A Mod providing a few recipes and integration with other Mods
-- by MTDad

-- Get the coffee
dofile(minetest.get_modpath("farming_food").."/hotcoffee.lua")

-- If food mod installed, load extra recipes
if minetest.get_modpath("food") then
	dofile(minetest.get_modpath("farming_food").."/recipes.lua")
end

-- pickup new food and register it with hud/diet

local path = nil
local function overwrite(name, hunger_change, replace_with_item)
	local tab = minetest.registered_items[name]
	if tab == nil then return end
	tab.on_use = path.item_eat(hunger_change, replace_with_item)
	minetest.registered_items[name] = tab
end

if minetest.get_modpath("diet") then path = diet
	elseif minetest.get_modpath("hud") then path = hud
	end
if path ~= nil then
	overwrite("farming_plus:corn_item", 2)
	overwrite("farming_plus:corn_cob", 5)
	overwrite("farming_plus:cucumber_item", 2)
	overwrite("farming_plus:lemon_item", 2)
	overwrite("farming_plus:melon_item", 2)
	overwrite("farming_plus:peach_item", 2)
	overwrite("farming_plus:raspberry_item", 2)
	overwrite("farming_plus:walnut_item", 2)
	overwrite("farming:pumpkin_slice", 2)
	overwrite("farming_food:coffee_mug_hot", 2, "farming_food:coffee_mug_empty")
	if minetest.get_modpath("food") then
		overwrite("farming_food:corn_bread", 4)
		overwrite("farming_food:peach_cobbler", 4)
		overwrite("farming_food:strawberry_lemonade", 2)
		overwrite("farming_food:cookie_chocochip", 2)
		overwrite("farming_food:pie_cooked", 6)
		overwrite("farming_food:fritter_walnut", 6)
		overwrite("farming_food:fritter_corn", 6)
		overwrite("farming_food:fritter_apple", 6)
	end
end


