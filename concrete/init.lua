--Mod adds two concrete textures

minetest.register_node("concrete:new", {
    description = "New Concrete",
    tiles = {"concrete_new.png"},
    is_ground_content = false,
    groups = {cracky = 1},
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("concrete:ancient", {
    description = "Ancient Concrete",
    tiles = {"concrete_ancient.png"},
    is_ground_content = false,
    groups = {cracky = 2},
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("concrete:asphalt", {
	description = "Asphalt",
	tiles = {"concrete_new.png^[colorize:#000000:200"},
	is_ground_content= false,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
})
--craft recipes

minetest.register_craft({
    type = "shapeless",
    output = "concrete:new",
    recipe = {"default:cobble"}
})

minetest.register_craft({
    type = "shapeless",
    output = "concrete:ancient",
    recipe = {"concrete:new"}
})

minetest.register_craft({
	type = "shapeless",
	output = "concrete:asphalt",
	recipe = {"concrete:new", "dye:black"}
})

if minetest.get_modpath("moreblocks") ~= nil then
	stairsplus:register_all("concrete", "new", "concrete:new", {
		description = "New Concrete",
		tiles = {"concrete_new.png"},
		groups = {cracky = 2},
		sounds = default.node_sound_stone_defaults(),
	})

	stairsplus:register_all("concrete", "ancient", "concrete:ancient", {
		description = "Ancient Concrete",
		tiles = {"concrete_ancient.png"},
		groups = {cracky = 3},
		sounds = default.node_sound_stone_defaults(),
	})

	stairsplus:register_all("concrete", "asphalt", "concrete:asphalt", {
		description = "Asphalt",
		tiles = {"concrete_new.png^[colorize:#000000:200"},
		groups = {cracky = 2},
		sounds = default.node_sound_stone_defaults(),
	})
elseif
minetest.get_modpath("stairs") ~= nil then
  stairs.register_stair_and_slab(
      "New Concrete",
      "concrete:new",
      {cracky = 3},
      {"concrete_new.png"},
      "New Concrete Stair",
      "New Concrete Slab",
      default.node_sound_stone_defaults()
  )

  stairs.register_stair_and_slab(
      "Ancient Concrete",
      "concrete:ancient",
      {cracky = 3},
      {"concrete_ancient.png"},
      "Ancient Concrete Stair",
      "Ancient Concrete Slab",
      default.node_sound_stone_defaults()
  )
end
