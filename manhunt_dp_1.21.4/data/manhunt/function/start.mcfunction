#start the game
scoreboard players set @a is_game_started 1
scoreboard objectives remove start
title @a title "Game Start!"

#set world spawn point
kill @e[name="World spawn point"]
execute at @a[team=runner,limit=1] run summon armor_stand ~ ~ ~ {CustomName:'"World spawn point"'}
tag @e[name="World spawn point"] add world_spawn_point
execute at @e[name="World spawn point"] run forceload add ~ ~

#check if player is dead
scoreboard objectives add is_dead deathCount
scoreboard players set @a is_dead 0