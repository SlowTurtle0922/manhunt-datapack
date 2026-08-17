#keep everyone in game
gamerule keepInventory false
gamemode survival @a[scores={is_dead=0}]

#let compass point to runner
execute at @a[team=runner,limit=1,gamemode=survival] run setworldspawn ~ ~ ~

#protect the true world spawn point and kill fake ones
kill @e[name="World spawn point",tag=!world_spawn_point]
execute at @e[name="World spawn point",type=armor_stand,tag=world_spawn_point] run summon armor_stand ~ ~ ~ {CustomName:'"World spawn point"'}
kill @e[tag=world_spawn_point]
tag @e[name="World spawn point"] add world_spawn_point

#respawn hunters
execute as @a[team=hunter,scores={is_dead=1}] unless data entity @s SpawnX run tp @e[name="World spawn point",limit=1,type= armor_stand]
execute as @a[team=hunter,scores={is_dead=1}] run scoreboard players set @s is_dead 0

#if hunter has no compass, give them a new one
execute as @a[team=hunter] unless items entity @s container.* compass unless items entity @s player.cursor compass unless items entity @s weapon.offhand compass unless items entity @s player.crafting.* compass run give @s minecraft:compass 1

#tell hunter runners' position
execute as @a[team=hunter,tag=!know_runner_pos] if items entity @s weapon.mainhand compass run function manhunt:tell_hunter_where_runners_are
tag @a[team=hunter,tag=!know_runner_pos] add know_runner_pos
execute as @a[team=hunter,tag=know_runner_pos] unless items entity @s weapon.mainhand compass run tag @s remove know_runner_pos

#runner win
execute if entity @a[team=runner,advancements={end/kill_dragon=true}] run function manhunt:runner_win

#runner death
execute as @a[team=runner,scores={is_dead=1}] run gamemode spectator @s
execute unless entity @a[team=runner,gamemode=survival] run function manhunt:hunter_win