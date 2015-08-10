minetest.register_on_newplayer(function(player)
	--print("on_newplayer")
	if minetest.setting_getbool("give_initial_stuff") then
		minetest.log("action", "Giving initial stuff to player "..player:get_player_name())
		player:get_inventory():add_item('main', 'default:pick_steel')
		player:get_inventory():add_item('main', 'default:torch 99')
		player:get_inventory():add_item('main', 'default:axe_steel')
		player:get_inventory():add_item('main', 'default:shovel_steel')
        player:get_inventory():add_item('main', 'default:diamond 99')
		player:get_inventory():add_item('main', 'default:cobble 99')
        player:get_inventory():add_item('main', 'default:sapling 9')
        player:get_inventory():add_item('main', 'default:apple 99')
        player:get_inventory():add_item('main', 'default:tree 99')
        player:get_inventory():add_item('main', 'default:mese 16')
	end
end)

