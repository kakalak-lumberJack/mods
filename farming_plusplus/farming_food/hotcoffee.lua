-- Hot Coffee

-- Coffee Mug Nodes
minetest.register_node("farming_food:coffee_mug_empty", {
	description = "Empty Mug",
	drawtype = "nodebox",
	tiles = {"farming_coffee_mug_top_empty.png", "farming_coffee_mug.png", "farming_coffee_mug.png",
		"farming_coffee_mug.png", "farming_coffee_mug.png", "farming_coffee_mug.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.1875, 0.1875},
			{0.1875, -0.5, -0.0625, 0.3125, -0.1875, 0.0625},
			}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.1875, -0.5, -0.1875, 0.1875, -0.1875, 0.1875}
	},
	inventory_image = "farming_coffee_mug_inv.png",
	wield_image = "farming_coffee_mug_inv.png",
	paramtype = "light",
	walkable = false,
	groups = {food_mug=1, dig_immediate=3, attached_node=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("farming_food:coffee_mug_cold", {
	description = "Cold Mug of Coffee",
	drawtype = "nodebox",
	tiles = {"farming_coffee_mug_top_full.png", "farming_coffee_mug.png", "farming_coffee_mug.png",
		"farming_coffee_mug.png", "farming_coffee_mug.png", "farming_coffee_mug.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.1875, 0.1875},
			{0.1875, -0.5, -0.0625, 0.3125, -0.1875, 0.0625},
			}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.1875, -0.5, -0.1875, 0.1875, -0.1875, 0.1875}
	},
	inventory_image = "farming_coffee_mug_cold_inv.png",
	wield_image = "farming_coffee_mug_cold_inv.png",
	paramtype = "light",
	walkable = false,
	groups = {dig_immediate=3, attached_node=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_node("farming_food:coffee_mug_hot", {
	description = "Hot Mug of Coffee",
	drawtype = "nodebox",
	tiles = {"farming_coffee_mug_top_full.png", "farming_coffee_mug.png", "farming_coffee_mug.png",
		"farming_coffee_mug.png", "farming_coffee_mug.png", "farming_coffee_mug.png"},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.1875, 0.1875},
			{0.1875, -0.5, -0.0625, 0.3125, -0.1875, 0.0625},
			}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.1875, -0.5, -0.1875, 0.1875, -0.1875, 0.1875}
	},
	inventory_image = "farming_coffee_mug_hot_inv.png",
	wield_image = "farming_coffee_mug_hot_inv.png",
	paramtype = "light",
	walkable = false,
	groups = {dig_immediate=3, attached_node=1},
	sounds = default.node_sound_defaults(),
	on_use = minetest.item_eat(2, "farming_food:coffee_mug_empty")
})

-- coffee crafts

minetest.register_craft({
	output = "farming_food:coffee_mug_empty 5",
	recipe = {
		{"default:clay_lump", "default:clay_lump", "default:clay_lump"},
		{"default:clay_lump", "default:clay_lump", ""},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "farming_food:coffee_mug_cold",
	recipe = {"group:food_mug", "farming_plus:coffee_beans", "bucket:bucket_water"},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})

minetest.register_craft({
	type = "cooking",
	cooktime = 5,
	output = "farming_food:coffee_mug_hot",
	recipe = "farming_food:coffee_mug_cold"
})

-- make it steam

minetest.register_abm({
	nodenames = "farming_food:coffee_mug_hot",
	interval = 3,
	chance = 1,
	action = function(pos, node)
		if minetest.get_node({x=pos.x, y=pos.y+1.0, z=pos.z}).name == "air"
		then minetest.add_particlespawner({
			amount = 6,
			time = 1,
			minpos = {x=pos.x-0.0, y=pos.y-0.2, z=pos.z-0.0},
			maxpos = {x=pos.x+0.0, y=pos.y+0.2, z=pos.z+0.0},
			minvel = {x=-0.01, y=0.01, z=-0.01},
			maxvel = {x=0.01, y=0.02, z=-0.01},
			minacc = {x=0.0,y=-0.0,z=-0.0},
			maxacc = {x=0.0,y=0.01,z=-0.0},
			minexptime = 1,
			maxexptime = 4,
			minsize = 1,
			maxsize = 3,
			collisiondetection = true,
			texture = "farming_steam.png"
			})
		end
	end
})

minetest.register_alias("farming:drinking_cup", "farming_food:coffee_mug_empty")
minetest.register_alias("farming:coffee_cup", "farming_food:coffee_mug_cold")
minetest.register_alias("farming:coffee_cup_hot", "farming_food:coffee_mug_hot")
