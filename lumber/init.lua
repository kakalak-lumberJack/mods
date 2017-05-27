
--[[
Mod overrides textures for More Tree's wood planks as well as making changes to Lumber's game
]]--
minetest.override_item("default:cactus", {
	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

--add ultra axe
--dofile(minetest.get_modpath("lumber").."/ultra_axe.lua")

--register alias for blocks using same texture
minetest.register_alias("moretrees:beech_wood", "default:wood")
minetest.register_alias("moretrees:oak_wood", "default:wood")
