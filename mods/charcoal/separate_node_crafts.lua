-- separate file to avoid cluttering the init.lua
-- here goes all crafts if charcoal is a separate node from coal

-- ITEMS
minetest.register_craftitem("charcoal:charcoal_lump", {
        description = "Charcoal Lump",
        inventory_image = "default_coal_lump.png",
        groups = {coal = 1}
})

minetest.register_node("charcoal:charcoal_block", {
        description = "Charcoal Block",
        tiles = {"default_coal_block.png"},
        is_ground_content = false,
        groups = {cracky=3},
        sounds = default.node_sound_stone_defaults(),
})

-- CRAFTS
minetest.register_craft({
        output = "default:torch 4",
        recipe = {
                {"charcoal:charcoal_lump"},
                {"group:stick"},
        }
})

minetest.register_craft({
        output = "charcoal:charcoal_block",
        recipe = {
                {"charcoal:charcoal_lump", "charcoal:charcoal_lump", "charcoal:charcoal_lump"},
                {"charcoal:charcoal_lump", "charcoal:charcoal_lump", "charcoal:charcoal_lump"},
                {"charcoal:charcoal_lump", "charcoal:charcoal_lump", "charcoal:charcoal_lump"},
        }
})

minetest.register_craft({
        output = "charcoal:charcoal_lump 9",
        recipe = {
                {"charcoal:charcoal_block"},
        }
})

-- the dye ALREADY uses group:coal !

-- if module tnt exists and is set to active then you get your daily destruction
-- use the check from the tnt module itself
local singleplayer = minetest.is_singleplayer()
local setting = minetest.setting_getbool("enable_tnt")
if minetest.get_modpath("tnt") and
  (singleplayer and minetest.setting_getbool("enable_tnt") ~= false or
  not singleplayer and minetest.setting_getbool("enable_tnt")) then
    minetest.register_craft({
            output = "tnt:gunpowder",
            type = "shapeless",
            recipe = {"charcoal:charcoal_lump", "default:gravel"}
    })
end

-- FUELS
minetest.register_craft({
        type = "fuel",
        recipe = "charcoal:charcoal_lump",
        burntime = 40,
})

minetest.register_craft({
        type = "fuel",
        recipe = "charcoal:charcoal_block",
        burntime = 370,
})

