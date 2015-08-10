local minecraftaliases = true

local function register_chatcommand_alias(alias, cmd, def)
	def = def or {}
	local chatcommand = minetest.chatcommands[cmd]
	minetest.register_chatcommand(alias, {
		params = def.params or chatcommand.params,
		description = def.description or chatcommand.description,
		privs = def.privs or chatcommand.privs,
		func = def.func or chatcommand.func,
	})
end

if minecraftaliases then
	register_chatcommand_alias("?", "help")
	register_chatcommand_alias("list", "status")
	register_chatcommand_alias("pardon", "unban")
	register_chatcommand_alias("setblock", "setnode")
	register_chatcommand_alias("stop", "shutdown")
	register_chatcommand_alias("summon", "spawnentity")
	register_chatcommand_alias("tell", "msg")
	register_chatcommand_alias("w", "msg")
	register_chatcommand_alias("tp", "teleport")

	minetest.register_chatcommand("banlist", {
		description = "List bans",
		privs = minetest.chatcommands["ban"].privs,
		func = function(name)
			return true, "Ban list: " .. core.get_ban_list()
		end,
	})
end
