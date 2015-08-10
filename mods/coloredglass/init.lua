local coloredglass = {}

function coloredglass.node_sound_glass(table)
	table = table or {}
	table.footstep = table.footstep or
			{name="coloredglass_footstep", gain=0.5}
	table.dug = table.dug or
			{name="coloredglass_break", gain=1.0}
	table.place = table.place or
			{name="coloredglass_footstep", gain=1.0}
	return table
end

--[[ works fucking perfect bitch
minetest.register_node("coloredglass:blue", {
	description = "Colored Glass Blue",
	drawtype = "glasslike",
	tiles = {"coloredglass_blue.png"},
    alpha = 50,
	inventory_image = minetest.inventorycube("coloredglass_blue.png"),
	paramtype = "light",
	sunlight_propagates = true,
    is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = coloredglass.node_sound_glass(),
})
--]]

coloredglass.colors = {
	{"white",      "White",      "basecolor_white"},
	{"grey",       "Grey",       "basecolor_grey"},
	{"black",      "Black",      "basecolor_black"},
	{"red",        "Red",        "basecolor_red"},
	{"yellow",     "Yellow",     "basecolor_yellow"},
	{"green",      "Green",      "basecolor_green"},
	{"cyan",       "Cyan",       "basecolor_cyan"},
	{"blue",       "Blue",       "basecolor_blue"},
	{"magenta",    "Magenta",    "basecolor_magenta"},
	{"orange",     "Orange",     "excolor_orange"},
 	{"brown",      "Brown",      "unicolor_dark_orange"},
}

for _, row in ipairs(coloredglass.colors) do
	local name = row[1]
	local desc = row[2]
	local craft_color_group = row[3]
	minetest.register_node("coloredglass:"..name, {
		description = "Colored Glass "..desc,
		drawtype = "glasslike",
        tiles = {"coloredglass_"..name..".png"},
        alpha = 50,
        inventory_image = minetest.inventorycube("coloredglass_"..name..".png"),
        paramtype = "light",
        sunlight_propagates = true,
        is_ground_content = false,
		groups = {cracky=3,oddly_breakable_by_hand=3},
		sounds = coloredglass.node_sound_glass(),
	})
	if craft_color_group then
		minetest.register_craft({
			type = "shapeless",
			output = 'coloredglass:'..name.." 4",
--			recipe = {'group:dye,'..craft_color_group, 'group:coloredglass'},
			recipe = {'group:dye,'..craft_color_group, 'default:glass'},
	})
	end
end

print("[Colored Glass] Loaded!")
