-- Wiki command
minetest.register_chatcommand("wiki",{
	params = "",
	description = "Shows the wiki main page",
	func = function(name, param)
		minetest.chat_send_player(name, "Showing wiki main page... if this doesn't work please try again.")
		if minetest.get_player_privs(name).wiki then
			wikilib.show_wiki_page(name, "#Main")
		else
			wikilib.show_wiki_page(name, "Main")
		end
	end,
})

-- server restart command
minetest.register_chatcommand("restart", {
	description = "restart server",
	privs = {ban=true, areas=true},
	func = function(name, param)
		if name == "lumberJack" or "okidoki"  then
			minetest.log("action", name.. " restarts server")
			minetest.chat_send_all("Server is restarting in 60 seconds to reduce lag (request made by "..name..")")
			minetest.after(30, function()
				minetest.chat_send_all("Server is restarting in 30 seconds to reduce lag (request made by "..name..")")
			end)
			minetest.after(50, function()
				minetest.chat_send_all("Server is restarting in 10 seconds to reduce lag (request made by "..name.."). Please reconnect a short while after the server shuts down.")
			end)
			minetest.after(60, function()
				minetest.chat_send_all("*** Server shutting down. Please reconnect.")
				minetest.request_shutdown("*** Server was restarted to reduce lag, please reconnect a short while after this message.",true)
			end)
		else minetest.chat_send_player(name, "Restarting the server is a limited function that is not applicable to you.")
		end
	end,
})
