local function handle_clear_command(giver, receiver)
	local receiverref = minetest.get_player_by_name(receiver)
	if receiverref == nil then
		return false, ("Player %q does not exist."):format(receiver)
	end
	if receiverref:get_inventory():is_empty("main") then
		if giver == receiver then
			return false, ("Your inventory is already clear.")
		else
			minetest.log("action", ("%s attempted to clear %s's inventory"):format(giver, receiver))
			return false, ("%s's inventory is already clear.")
		end
	end
	if not giver == receiver then
		minetest.log("action", ("%s cleared %s's inventory"):format(giver, receiver))
	end
	for i=0,receiverref:get_inventory():get_size("main") do
		receiverref:get_inventory():set_stack("main", i, nil)
	end
	if giver == receiver then
		return true, ("Your inventory was cleared.")
	else
		minetest.chat_send_player(receiver, ("Your inventory was cleared."))
		return true, ("%s's inventory was cleared.")
	end
end

local function handle_kill_command(suspect, victim)
	local victimref = minetest.get_player_by_name(victim)
	if victimref == nil then
		return false, ("Player %q does not exist."):format(victim)
	elseif victimref:get_hp() <= 0 then
		if suspect == victim then
			return false, "You are already dead"
		else
			return false, ("%s is already dead"):format(victim)
		end
	end
	if not suspect == victim then
		minetest.log("action", ("%s allegedly killed %s"):format(suspect, victim))
	end
	victimref:set_hp(0)
end

minetest.register_privilege("clear", "Can use /clear")
minetest.register_privilege("kill", "Can use /kill")
minetest.register_privilege("announce", "Can use /say")

minetest.register_chatcommand("clear", {
	params = "<name>",
	description = "Clear inventory of player",
	privs = {clear=true},
	func = function(name, param)
		return handle_clear_command(name, param)
	end,
})

minetest.register_chatcommand("clearme", {
	description = "Clear your inventory",
	func = function(name)
		return handle_clear_command(name, name)
	end,
})

minetest.register_chatcommand("kill", {
	params = "<name>",
	description = "Kill player",
	privs = {kill=true},
	func = function(name, param)
		return handle_kill_command(name, param)
	end,
})

minetest.register_chatcommand("killme", {
	description = "Kill yourself",
	func = function(name)
		return handle_kill_command(name, name)
	end,
})

minetest.register_chatcommand("say", {
	params = "<message>",
	description = "Send a message to every player",
	privs = {announce=true},
	func = function(name, param)
		if not param then
			return false, "Invalid usage, see /help say."
		end
		minetest.chat_send_all(("[%s] %s"):format(name, param))
		return true
	end,
})

minetest.register_chatcommand("setnode", {
	params = "<X>,<Y>,<Z> <NodeString>",
	description = "Set node at given position",
	privs = {give=true, interact=true},
	func = function(name, param)
		local p = {}
		local nodestring = nil
		p.x, p.y, p.z, nodestring = param:match("^([%d.-]+)[, ] *([%d.-]+)[, ] *([%d.-]+) +(.+)$")
		p.x, p.y, p.z = tonumber(p.x), tonumber(p.y), tonumber(p.z)
		if p.x and p.y and p.z and nodestring then
			local itemstack = ItemStack(nodestring)
			if itemstack:is_empty() or not minetest.registered_nodes[itemstack:get_name()] then
				return false, 'Invalid node'
			end
			minetest.set_node(p, {name=nodestring})
			return true, ("%q spawned."):format(nodestring)
		end
		return false, 'Invalid parameters (see /help setnode)'
	end,
})

dofile(minetest.get_modpath("commands").."/aliases.lua")
