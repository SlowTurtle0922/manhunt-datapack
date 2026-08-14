#start the game
scoreboard players set @a is_game_started 1
scoreboard objectives remove start

#set world spawn point
execute at @a[team=runner,limit=1] run summon armor_stand ~ ~ ~ {CustomName:'"World spawn point"'}
effect give @e[name="World spawn point"] invisibility infinite 0 true
execute at @e[name="World spawn point"] run forceload add ~ ~

#check if player is dead
scoreboard objectives add is_dead deathCount
scoreboard players set @a is_dead 0