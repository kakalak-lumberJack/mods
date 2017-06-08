--priv to allow players to travel the map freely
minetest.register_privilege("passport", {
  "Allows player to leave city limits", give_to_singleplayer = false
})

-- City list
local city1 = "spawn"
local city2 = "mall"
local city3 = "mine"
local city4 = "wild"
local city5 = "oasis"
local city6 = "mythica"
local city7 = "alpha"
local city8 = "ussr"
local city9 = "futurama"
local city10 = "sheldon"
--city's central position
local city1_pos = {x = 0, y = 16, z = 0}
local city2_pos = {x = -404, y = 35, z = -1209}
local city3_pos = {x = 0, y = -1000, z = 0}
local city4_pos = {x = -17501, y = 45, z = -51}
local city5_pos = {x = 11276, y = 48, z = -4196}
local city6_pos = {x = 1431, y = 22, z = -668}
local city7_pos = {x = 47, y = 20179, z = 97}
local city8_pos = {x = 222, y = 20094, z = 573}
local city9_pos = {x = 1664, y = 20, z = -906}
local city10_pos = {x = -431, y = 21, z = 214}
--register chat commands to teleport to each cities

--city1
minetest.register_on_chat_message(function(name, message, playername, player)
	if city1_pos ~= nil then
		local cmd = "/"..city1
		if message:sub(0, #cmd) == cmd then
			if message == '/'..city1 then
				local player = minetest.get_player_by_name(name)
				minetest.chat_send_player(player:get_player_name(), "Teleporting to "..city1)
				player:setpos(city1_pos)
				return true
			end
		end
	end
end)

--city2
minetest.register_on_chat_message(function(name, message, playername, player)
	if city2_pos ~= nil then
		local cmd = "/"..city2
		if message:sub(0, #cmd) == cmd then
			if message == '/'..city2 then
				local player = minetest.get_player_by_name(name)
				minetest.chat_send_player(player:get_player_name(), "Teleporting to "..city2)
				player:setpos(city2_pos)
				return true
			end
		end
	end
end)

--city3
minetest.register_on_chat_message(function(name, message, playername, player)
	if city3_pos ~= nil then
		local cmd = "/"..city3
		if message:sub(0, #cmd) == cmd then
			if message == '/'..city3 then
				local player = minetest.get_player_by_name(name)
				minetest.chat_send_player(player:get_player_name(), "Teleporting to "..city3)
				player:setpos(city3_pos)
				return true
			end
		end
	end
end)

--city4
minetest.register_on_chat_message(function(name, message, playername, player)
	if city4_pos ~= nil then
		local cmd = "/"..city4
		if message:sub(0, #cmd) == cmd then
			if message == '/'..city4 then
				local player = minetest.get_player_by_name(name)
				minetest.chat_send_player(player:get_player_name(), "Teleporting to "..city4)
				player:setpos(city4_pos)
				return true
			end
		end
	end
end)

--city5
minetest.register_on_chat_message(function(name, message, playername, player)
	if city5_pos ~= nil then
		local cmd = "/"..city5
		if message:sub(0, #cmd) == cmd then
			if message == '/'..city5 then
				local player = minetest.get_player_by_name(name)
				minetest.chat_send_player(player:get_player_name(), "Teleporting to "..city5)
				player:setpos(city5_pos)
				return true
			end
		end
	end
end)
--city6
minetest.register_on_chat_message(function(name, message, playername, player)
	if city6_pos ~= nil then
		local cmd = "/"..city6
		if message:sub(0, #cmd) == cmd then
			if message == '/'..city6 then
				local player = minetest.get_player_by_name(name)
				minetest.chat_send_player(player:get_player_name(), "Teleporting to "..city6)
				player:setpos(city6_pos)
				return true
			end
		end
	end
end)
--city7
minetest.register_on_chat_message(function(name, message, playername, player)
	if city7_pos ~= nil then
		local cmd = "/"..city7
		if message:sub(0, #cmd) == cmd then
			if message == '/'..city7 then
				local player = minetest.get_player_by_name(name)
				minetest.chat_send_player(player:get_player_name(), "Teleporting to "..city7)
				player:setpos(city7_pos)
				return true
			end
		end
	end
end)

--city8
minetest.register_on_chat_message(function(name, message, playername, player)
	if city8_pos ~= nil then
		local cmd = "/"..city8
		if message:sub(0, #cmd) == cmd then
			if message == '/'..city8 then
				local player = minetest.get_player_by_name(name)
				minetest.chat_send_player(player:get_player_name(), "Teleporting to "..city8)
				player:setpos(city8_pos)
				return true
			end
		end
	end
end)

--city9
minetest.register_on_chat_message(function(name, message, playername, player)
	if city9_pos ~= nil then
		local cmd = "/"..city9
		if message:sub(0, #cmd) == cmd then
			if message == '/'..city9 then
				local player = minetest.get_player_by_name(name)
				minetest.chat_send_player(player:get_player_name(), "Teleporting to "..city9)
				player:setpos(city9_pos)
				return true
			end
		end
	end
end)

--city10
minetest.register_on_chat_message(function(name, message, playername, player)
	if city10_pos ~= nil then
		local cmd = "/"..city10
		if message:sub(0, #cmd) == cmd then
			if message == '/'..city10 then
				local player = minetest.get_player_by_name(name)
				minetest.chat_send_player(player:get_player_name(), "Teleporting to "..city10)
				player:setpos(city10_pos)
				return true
			end
		end
	end
end)

--check player's passports

local worldtimer = 0
minetest.register_globalstep(function(dtime)
   worldtimer = worldtimer + dtime
   -- Every 7 seconds
   if worldtimer < 3 then return end
   worldtimer = 0

   for _,player in ipairs(minetest.get_connected_players()) do
    if minetest.get_player_privs(player:get_player_name()).passport then break
    else
   	-- Where am I?
		local pos = player:getpos()

--check city1 limits

		if pos.x > city1_pos.x-200 and pos.x < city1_pos.x+200 and
			pos.y > city1_pos.y-40 and pos.y < city1_pos.y+1000 and
			pos.z > city1_pos.z-200 and pos.z < city1_pos.z+200 then break


--check city2 limits
		elseif
			pos.x > city2_pos.x-200 and pos.x < city2_pos.x+200 and
			pos.y > city2_pos.y-40 and pos.y < city2_pos.y+1000 and
			pos.z > city2_pos.z-200 and pos.z < city2_pos.z+200 then break

--check city3 limits
		elseif
			pos.x > city3_pos.x-2500 and pos.x < city3_pos.x+2500 and
			pos.y > city3_pos.y-30000 and pos.y < city3_pos.y+5 and
			pos.z > city3_pos.z-2500 and pos.z < city3_pos.z+2500 then break

--check city4 limits
		elseif
			pos.x > city4_pos.x-2000 and pos.x < city4_pos.x+2000 and
			pos.y > city4_pos.y-30000 and pos.y < city4_pos.y+10000 and
			pos.z > city4_pos.z-2000 and pos.z < city4_pos.z+2000 then break
      
--check city5 limits
		elseif
			pos.x > city5_pos.x-200 and pos.x < city5_pos.x+200 and
			pos.y > city5_pos.y-80 and pos.y < city5_pos.y+1000 and
			pos.z > city5_pos.z-200 and pos.z < city5_pos.z+200 then break
			
--check city6 limits
		elseif
			pos.x > city6_pos.x-200 and pos.x < city6_pos.x+200 and
			pos.y > city6_pos.y-30000 and pos.y < city6_pos.y+10000 and
			pos.z > city6_pos.z-200 and pos.z < city6_pos.z+200 then break			

--check city7 limits
		elseif
			pos.x > city7_pos.x-500 and pos.x < city7_pos.x+500 and
			pos.y > city7_pos.y-2000 and pos.y < city7_pos.y+10000 and
			pos.z > city7_pos.z-500 and pos.z < city7_pos.z+500 then break			

--check city8 limits
		elseif
			pos.x > city8_pos.x-200 and pos.x < city8_pos.x+200 and
			pos.y > city8_pos.y-200 and pos.y < city8_pos.y+200 and
			pos.z > city8_pos.z-200 and pos.z < city8_pos.z+200 then break	
			
--check city9 limits
		elseif
			pos.x > city9_pos.x-200 and pos.x < city9_pos.x+200 and
			pos.y > city9_pos.y-200 and pos.y < city9_pos.y+200 and
			pos.z > city9_pos.z-200 and pos.z < city9_pos.z+200 then break
			
--check city10 limits
		elseif
			pos.x > city10_pos.x-200 and pos.x < city10_pos.x+200 and
			pos.y > city10_pos.y-200 and pos.y < city10_pos.y+200 and
			pos.z > city10_pos.z-200 and pos.z < city10_pos.z+200 then break							

--after all cities checked send players outside city limits without passport to spawn
		else
			local statspawn = (minetest.setting_get_pos("static_spawnpoint") or {x = 0, y = 16, z = 0})
				player:setpos(statspawn)
				local name = player:get_player_name()
				minetest.chat_send_player(name, "You must stay within city limits, returning to City's Center")
				minetest.log("action", "[Citylimits] Player "..name.."caught outside city limits!")
 	    end
    end
 end
end)
