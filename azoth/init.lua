
minetest.register_node("azoth:azoth_source", {
	description = "Azoth Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "azoth_source.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
		},
	},
	special_tiles = {
		
		{
			name = "azoth_source.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.0,
			},
			backface_culling = false,
		},
	},
	paramtype = "light",
	light_source = 8,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = true,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "azoth:azoth_flowing",
	liquid_alternative_source = "azoth:azoth_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	
	post_effect_color = {a = 191, r = 245, g = 245, b = 255},
	groups = {liquid = 2, azoth = 1},
})

minetest.register_node("azoth:azoth_flowing", {
	description = "Flowing Azoth",
	drawtype = "flowingliquid",
	tiles = {"azoth.png"},
	special_tiles = {
		{
			name = "azoth_flowing.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
		{
			name = "azoth_flowing.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 3.3,
			},
		},
	},
	paramtype = "light",
	paramtype2 = "flowingliquid",
	light_source = 8,
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = true,
	drop = "",
	drowning = 1,
	
	liquidtype = "flowing",
	liquid_alternative_flowing = "azoth:azoth_flowing",
	liquid_alternative_source = "azoth:azoth_source",
	liquid_viscosity = 7,
	liquid_renewable = false,
	
	post_effect_color = {a = 191, r = 245, g = 245, b = 255},
	groups = {liquid = 2, not_in_creative_inventory = 1, azoth = 1},
})
local checkpos = {}
local nodepos = {}
local azothgen = function(checkpos)
	if minetest.get_node(checkpos).name == "air" or 
	minetest.get_node(checkpos).name == "azoth:azoth_flowing" then
-- Find place to create azoth pool
			repeat checkpos = {x = checkpos.x, y = checkpos.y - 1, z = checkpos.z}
			until minetest.get_node(checkpos).name ~= "air"
-- Generate pool			
			nodepos = {x = checkpos.x, y = checkpos.y + 1, z = checkpos.z}
			minetest.add_node(nodepos, {name="azoth:azoth_source"})
			local adjnodepos ={
				{x = nodepos.x + 1, y = nodepos.y, z = nodepos.z},
				{x = nodepos.x - 1, y = nodepos.y, z = nodepos.z},
				{x = nodepos.x + 1, y = nodepos.y, z = nodepos.z + 1},
				{x = nodepos.x + 1, y = nodepos.y, z = nodepos.z - 1},
				{x = nodepos.x - 1, y = nodepos.y, z = nodepos.z + 1},
				{x = nodepos.x - 1, y = nodepos.y, z = nodepos.z - 1},
				{x = nodepos.x, y = nodepos.y, z = nodepos.z + 1},
				{x = nodepos.x, y = nodepos.y, z = nodepos.z - 1}
			}
			for number = 1,8 do
				nodepos = adjnodepos[number]
				if minetest.get_node(nodepos).name == "air" then
				minetest.add_node(nodepos, {name="azoth:azoth_source"})	
				end
			end
				print("[azoth] Generated Azoth Source at "..dump(nodepos))    
              -- minetest.chat_send_all("Generated Azoth Pool at "..dump(nodepos))                    
			
	end
end

minetest.register_on_generated(function(minp, maxp)
	if maxp.y <= -4000 then
-- Random check for caves deep underground
		checkpos = {
			x = minp.x + math.random() * 80,
			y = minp.y + math.random() * 80,
			z = minp.z + math.random() * 80  
		}   
		azothgen(checkpos)	 	           
	end
	if maxp.y <= -6000 then
checkpos = {
			x = minp.x + math.random() * 80,
			y = minp.y + math.random() * 80,
			z = minp.z + math.random() * 80  
		}   
		azothgen(checkpos)	 
	end
	if maxp.y <= -8000 then
checkpos = {
			x = minp.x + math.random() * 80,
			y = minp.y + math.random() * 80,
			z = minp.z + math.random() * 80  
		}   
		azothgen(checkpos)	 
	end
	
	if maxp.y <= -10000 then
checkpos = {
			x = minp.x + math.random() * 80,
			y = minp.y + math.random() * 80,
			z = minp.z + math.random() * 80  
		}   
		azothgen(checkpos)	 
	end
	
end)

dofile(minetest.get_modpath("azoth").."/bucket.lua") 
dofile(minetest.get_modpath("azoth").."/transmutation.lua")
