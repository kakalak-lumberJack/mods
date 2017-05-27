minetest.register_privilege("hell", "Can send players to hell and back")                                                                   
                                                                                                                                           
minetest.register_chatcommand("hell", {                                                                                                    
    description = "Turn a player's sky red",                                                                                               
    privs = {hell = true},                                                                                                                 
    func = function(name, params)                                                                                                          
        local param0 = params:match("^(%S+)")                                                                                              
        if param0 == nil then                                                                                                              
            return false, "You need to enter a player name"                                                                                
        end                                                                                                                                
        local player = minetest.get_player_by_name(param0)                                                                                 
        if player == nil then                                                                                                              
            return false, ("Could not find player " .. param0)                                                                             
        end                                                                                                                                
        minetest.log("action", name .. " sends " .. param0 .. " to hell.")                                                                 
                                                                                                                                           
        player:set_sky({r = 224, g = 0, b = 0}, "plain", nil)                                                                              
        player:override_day_night_ratio(0.1)   

		minetest.set_player_privs(name, {
	interact = false,
	shout = true })                                                                                            
    end                                                                                                                                    
})                                                                                                                                         
                                                                                                                                           
minetest.register_chatcommand("nohell", {                                                                                                  
    description = "Turn a player's sky normal",                                                                                            
    privs = {hell = true},                                                                                                                 
    func = function(name, params)                                                                                                          
        local param0 = params:match("^(%S+)")                                                                                              
        if param0 == nil then                                                                                                              
            return false, "You need to enter a player name"                                                                                
        end                                                                                                                                
        local player = minetest.get_player_by_name(param0)                                                                                 
        if player == nil then                                                                                                              
            return false, ("Could not find player " .. param0)                                                                             
        end                                                                                                                                
        minetest.log("action", name .. " returns " .. param0 .. " from hell.")                                                             
                                                                                                                                           
        player:set_sky({r = 255, g = 255, b = 255}, "regular", nil)                                                                        
        player:override_day_night_ratio(nil)                                                                                               
    end                                                                                                                                    
})
