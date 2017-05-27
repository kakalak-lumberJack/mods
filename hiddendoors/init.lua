-- HiddenDoors

hiddendoors = {}

function hiddendoors.register_door(material, name, tile_name)
	minetest.register_node("hiddendoors:" .. material, {
	description = name .. " Hidden Door",
	walkable = false,
	climbable = true,
	is_ground_content = false,
	inventory_image = "hiddendoors_" .. material .. "_inventory.png",
	tiles = {"default_" .. tile_name .. ".png"},
	groups = {cracky = 2},
	})
	
	minetest.register_craft({
		output = "hiddendoors:" .. material .. " 2",
		recipe = {
		{"", "", ""},
		{"default:glass", "default:" .. material , ""},
		{"", "", ""}
		}
	})
end

hiddendoors.register_door("obsidian", "Obsidian", "obsidian")
hiddendoors.register_door("stone", "Stone", "stone")
hiddendoors.register_door("desert_stonebrick", "Desert Stone Brick", "desert_stone_brick")
hiddendoors.register_door("stonebrick", "Stone Brick", "stone_brick")
hiddendoors.register_door("tree", "Tree", "tree")
hiddendoors.register_door("dirt", "Dirt", "dirt")
hiddendoors.register_door("desert_stone", "Desert Stone", "desert_stone")
hiddendoors.register_door("brick", "Brick", "brick")
hiddendoors.register_door("wood", "Wood", "wood")
