minetest.register_tool("lumber:ultra_axe", {
    description = "Ultra Axe",
    inventory_image = "ultra_axe.png",
    tool_capabilities = {
      full_punch_interval = 0.3,
      max_drop_level = 3,
      group_caps = {
        fleshy = {times={[1]=0, [2]=0, [3]=0}, uses=50, maxlevel=3},
		choppy = {times={[1]=0, [2]=0, [3]=0}, uses=50, maxlevel=3},
		cracky = {times={[1]=0, [2]=0, [3]=0}, uses=60, maxlevel=3},
		crumbly = {times={[1]=0, [2]=0, [3]=0}, uses=50, maxlevel=3},
		snappy = {times={[1]=0, [2]=0, [3]=0}, uses=50, maxlevel=3},
      },
      damage_groups = {fleshy = 9},
    }
})

minetest.register_craft({
  output = "lumber:ultra_axe",
  recipe = {
    {"default:steel_ingot", "default:stick", "default:steel_ingot"},
    {"default:steel_ingot", "default:stick", "default:steel_ingot"},
    {"","semiprecious:amethyst",""},
  }
})
