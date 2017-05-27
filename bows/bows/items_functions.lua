
bows.arrow_dig=function(self,pos,user,lastpos)
	minetest.node_dig(pos, minetest.get_node(pos), user)
	bows.arrow_remove(self)
	return self
end


bows.arrow_fire_object=function(self,target,hp,user,lastpos)
	bows.arrow_fire(self,lastpos,user,target:getpos())
	return self
end

bows.arrow_fire=function(self,pos,user,lastpos)
	local name=user:get_player_name()
	local node=minetest.get_node(lastpos).name
	if minetest.is_protected(lastpos, name) then
		minetest.chat_send_player(name, minetest.pos_to_string(lastpos) .." is protected")
	elseif minetest.registered_nodes[node].buildable_to then
		minetest.set_node(lastpos,{name="fire:basic_flame"})
	end
	bows.arrow_remove(self)
	return self
end

bows.arrow_build=function(self,pos,user,lastpos)
	local name=user:get_player_name()
	local node=minetest.get_node(lastpos).name
	local index=user:get_wield_index()+1
	local inv=user:get_inventory()
	local stack=inv:get_stack("main", index)
	if minetest.is_protected(lastpos, name) then
		minetest.chat_send_player(name, minetest.pos_to_string(lastpos) .." is protected")
	elseif minetest.registered_nodes[node].buildable_to
	and minetest.registered_nodes[stack:get_name()] then
		minetest.set_node(lastpos,{name=stack:get_name()})
		if bows.creative==false then
			inv:set_stack("main",index,ItemStack(stack:get_name() .. " " .. (stack:get_count()-1)))
		end
	end
	bows.arrow_remove(self)
	return self
end

bows.arrow_toxic=function(self,target,hp,user,lastpos)
	if self.object==nil or user==nil or target==nil or target:get_properties()==nil then
		bows.arrow_remove(self)
		return self
	end
	target:punch(user, 3,{full_punch_interval=1.0,damage_groups={fleshy=4}}, nil)
	local rnd=math.random(1,10)
	if rnd~=4 and  target:get_hp()>0 then
		minetest.after(math.random(0.5,2), function(self,target,hp,user,lastpos)
			bows.arrow_toxic(self,target,hp,user,lastpos)
		end, self,target,hp,user,lastpos)
	else
		bows.arrow_remove(self)
	end
end

bows.arrow_tetanus=function(self,target,hp,user,lastpos)
	if self.object==nil or user==nil or target==nil or target:get_properties()==nil then
		bows.arrow_remove(self)
		return self
	end
	if target:get_attach()==nil then
		self.object:set_detach()
		local col=target:get_properties().collisionbox
		self.object:set_properties({
			collisionbox=col,
			physical=true,
			visual_size={x=1,y=1},
			visual="sprite",
			textures={"bows_hidden.png"}
		})
		self.object:setpos(target:getpos())
		target:set_attach(self.object, "", {x=0,y=0,z=0},{x=0,y=0,z=0})
		self.target=target
		self.hp=self.object:get_hp()
		self.object:setvelocity({x=0, y=-3, z=0})
		self.object:setacceleration({x=0, y=-3, z=0})
		return self
	end

	local rnd=math.random(1,10)
	if rnd~=4 and  target:get_hp()>0 then
		minetest.after(math.random(4), function(self,target,hp,user,lastpos)
			bows.arrow_tetanus(self,target,hp,user,lastpos)
		end, self,target,hp,user,lastpos)
	else
		target:set_detach()
		target:setvelocity({x=0, y=4, z=0})
		target:setacceleration({x=0, y=-10, z=0})
		bows.arrow_remove(self)
	end
end

bows.arrow_admin_object=function(self,target,hp,user,lastpos)
	target:set_hp(0)
	target:punch(self.object, 9000,{full_punch_interval=1.0,damage_groups={fleshy=4}}, "default:sword_wood", nil)
	bows.arrow_remove(self)
	return self
end

bows.arrow_admin_node=function(self,pos,user,lastpos)
	bows.arrow_remove(self)
	return self
end

bows.arrow_rainbow_step=function(self,dtime,user,pos,lastpos)
minetest.add_particlespawner({
	amount = 90,
	time =0.5,
	minpos = pos,
	maxpos =pos,
	minvel = {x=-1, y=-1, z=-1},
	maxvel = {x=1, y=-0.5, z=1},
	minacc = {x=0, y=0, z=0},
	maxacc = {x=0, y=0, z=0},
	minexptime = 1.0,
	maxexptime = 1.5,
	minsize = 2.6,
	maxsize = 1.2,
	texture = "bows_rainbow.png",
})
end

bows.arrow_rainbow_object=function(self,target,hp,user,lastpos)
	local pos=target:getpos()
	minetest.add_particle({
		pos = pos,
		velocity = vector.new(),
		acceleration = vector.new(),
		expirationtime = 0.4,
		size = 20,
		collisiondetection = false,
		vertical = false,
		texture = "bows_rainbow.png",
	})
	minetest.add_particlespawner({
		amount = 100,
		time = 0.5,
		minpos = vector.subtract(pos, 3),
		maxpos = vector.add(pos, 3),
		minvel = {x = -10, y = -10, z = -10},
		maxvel = {x = 10, y = 10, z = 10},
		minacc = vector.new(),
		maxacc = vector.new(),
		minexptime = 1,
		maxexptime = 2.5,
		minsize = 3,
		maxsize = 9,
		texture = "bows_rainbow.png",
	})
end


bows.arrow_tnt_object=function(self,target,hp,user,lastpos)
	local name=user:get_player_name()
	local pos=target:getpos()
	if not minetest.is_protected(lastpos, name) then
		nitroglycerine.explode(pos,{
		place_chance=1,
		user_name=name,
		})
	end
	bows.arrow_remove(self)
	return self
end

bows.arrow_tnt_node=function(self,pos,user,lastpos)
	local name=user:get_player_name()
	if not minetest.is_protected(lastpos, name) then
		nitroglycerine.explode(pos,{
		place_chance=1,
		user_name=name,

		})
	end
	bows.arrow_remove(self)
	return self
end

bows.arrow_cooltnt_node=function(self,pos,user,lastpos)
	local name=user:get_player_name()
	local radius=3
	if not minetest.is_protected(lastpos, name) then
		nitroglycerine.explode(pos,{
		place_chance=1,
		user_name=name,
		drops=0,
		velocity=0,
		hurt=0,
		place={"default:snowblock","default:ice","default:snowblock"},
		place_chance=1,
		})
	end
	for _, ob in ipairs(minetest.get_objects_inside_radius(pos, radius*2)) do
		local pos2=ob:getpos()
		local d=math.max(1,vector.distance(pos,pos2))
		local dmg=(8/d)*radius
		if not (ob:get_luaentity() and ob:get_luaentity().name=="nitroglycerine:ice") then
			if ob:get_hp()<=dmg+5 then
				nitroglycerine.freeze(ob)
			else
				ob:punch(ob,1,{full_punch_interval=1,damage_groups={fleshy=dmg}},nil)
			end
		end
	end
	bows.arrow_remove(self)
	return self
end
bows.arrow_cooltnt_object=function(self,target,hp,user,lastpos)
	local name=user:get_player_name()
	local pos=target:getpos()
	local radius=3
	if not minetest.is_protected(lastpos, name) then
		nitroglycerine.explode(pos,{
		place_chance=1,
		user_name=name,
		drops=0,
		velocity=0,
		hurt=0,
		place={"default:snowblock","default:ice","default:snowblock"},
		place_chance=1,
		})
	end
	for _, ob in ipairs(minetest.get_objects_inside_radius(pos, radius*2)) do
		local pos2=ob:getpos()
		local d=math.max(1,vector.distance(pos,pos2))
		local dmg=(8/d)*radius

		if not (ob:get_luaentity() and ob:get_luaentity().name=="nitroglycerine:ice") then
			if ob:get_hp()<=dmg+5 then
				nitroglycerine.freeze(ob)
			else
				ob:punch(ob,1,{full_punch_interval=1,damage_groups={fleshy=dmg}},nil)
			end
		end
	end
	bows.arrow_remove(self)
	return self
end

bows.arrow_nitrogen_object=function(self,target,hp,user,lastpos)
	local name=user:get_player_name()
	local pos=target:getpos()
	local dmg=8
	if target:get_hp()<=dmg+5 then
		nitroglycerine.freeze(target)
	else
		target:punch(target,1,{full_punch_interval=1,damage_groups={fleshy=dmg}},nil)
	end
	return self
end



bows.arrow_nuke_object=function(self,target,hp,user,lastpos)
	local name=user:get_player_name()
	local pos=target:getpos()
	if not minetest.is_protected(lastpos, name) then
		nitroglycerine.explode(pos,{
		place_chance=50,
		user_name=name,
		set="air",
		radius=20,
		drops=0,
		})
	end
	bows.arrow_remove(self)
	return self
end

bows.arrow_nuke_node=function(self,pos,user,lastpos)
	local name=user:get_player_name()
	if not minetest.is_protected(lastpos, name) then
		nitroglycerine.explode(pos,{
		place_chance=50,
		user_name=name,
		set="air",
		radius=20,
		drops=0,
		})
	end
	bows.arrow_remove(self)
	return self
end