Charcoal
====================

Adds renewable coal : charcoal.

Version: 0.2.1
License: WTFPL

Dependencies: default mod (found in minetest_game)

Report bugs or request help here:
https://github.com/vlkolak/charcoal

Installation
------------

Unzip the archive, rename the folder to to modfoldername and
place it in minetest/mods/minetest/

(  GNU/Linux: If you use a system-wide installation place
	it in ~/.minetest/mods/minetest/.  )

(  If you only want this to be used in a single world, place
	the folder in worldmods/ in your worlddirectory.  )

For further information or help see:
http://wiki.minetest.com/wiki/Installing_Mods

Settings
--------
In settings.txt per default and charcoal_settings.txt in any world.
charcoal.separate_node allow to use charcoal as a separate node from coal, enabling
it as an item (charcoal lump), its recipes (charcoal bloc, torches, tnt's gunpowder),
and charcoal as a fuel, with the same properties as coal.
It also enables using charcoal to make some black dye - the default recipe already uses
group:coal, which is good.

If charcoal.separate_node = false, then charcoal IS coal, and you won't see any difference,
except for the ability to char group:wood and group:tree - which should be any tree and wood -
in your furnace, to gain some lumps.

charcoal.cooking_time is charcoal cooking time in seconds.
charcoal.lump_per_tree is how many lumps you get per tree - below 4, the wood planks
to charcoal recipe is disabled.

Recipes
-------
Cook wood and tree in furnace to get charcoal lump.
Everything else IS coal's recipes, but with charcoal. 


Authors of media files
----------------------
This mod uses default textures and sounds.
Credits for those files go to the authors cited in minetest_game/default/README.txt : 
Zeg9 for default_coal_block.png, 
Gambit for default_coal.png,
and Mito551 for the bloc sound(s).
