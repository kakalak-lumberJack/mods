minetest.register_on_newplayer(function(player)
   minetest.after(5, function()
	 player:setpos({x=0, y=16, z=00})
   end)	
end)

minetest.register_on_respawnplayer(function(player)
    player:setpos({x=0, y=16, z=0})
    return true
end)
