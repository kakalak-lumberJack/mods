local basemetals = {
"default:stone_with_copper",
"default:copperblock",
"moreores:mineral_tin",
"moreores:tin_block"
}

local puremetals = {
"default:stone_with_gold",
"default:goldblock",
"moreores:mineral_silver",
"moreores:silver_block"
}

for i = 1,4 do

	local base = basemetals[i]
	local pure = puremetals[i]

minetest.register_abm{
	label = "transmute copper nodes",
	nodenames = {base},
	neighbors = {"group:azoth"},
	interval = 12,
	chance = 8,
	catch_up = 0,
	action = function(pos)
		minetest.set_node(pos, {name = pure})
	end,
}

end
