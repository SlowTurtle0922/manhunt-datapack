#keep everyone in game
gamerule keepInventory false
gamemode survival @a[scores={is_dead=0}]

#let compass point to runner
execute at @a[team=runner,limit=1] run setworldspawn ~ ~ ~

#respawn hunters
execute as @a[team=hunter,scores={is_dead=1}] unless data entity @s SpawnX run tp @e[name="World spawn point",limit=1]
execute as @a[team=hunter,scores={is_dead=1}] run scoreboard players set @s is_dead 0
#if hunter has no compass, give them a new one
execute as @a[team=hunter] unless items entity @s container.* compass unless items entity @s player.cursor compass unless items entity @s weapon.offhand compass unless items entity @s player.crafting.* compass run give @s minecraft:compass 1

#runner win
execute if entity @a[team=runner,advancements={end/kill_dragon=true}] run function manhunt:runner_win

#runner death
execute as @a[team=runner,scores={is_dead=1}] run gamemode spectator @s
execute unless entity @a[team=runner,gamemode=survival] run function manhunt:hunter_win