tag @s add who_wants_runner_pos

#update runners' position
execute as @a[team=runner] store result score @s runner_x run data get entity @s Pos[0]
execute as @a[team=runner] store result score @s runner_y run data get entity @s Pos[1]
execute as @a[team=runner] store result score @s runner_z run data get entity @s Pos[2]

#tell runners' position
execute as @a[team=runner] run tellraw @a[tag=who_wants_runner_pos] {"selector":"@s","color":"green","extra":[{"text":" are at [","color":"white","extra":[{"score":{"name":"@s","objective":"runner_x"},"color":"red"}," ",{"score":{"name":"@s","objective":"runner_y"},"color":"red"}," ",{"score":{"name":"@s","objective":"runner_z"},"color":"red"}," ",{"nbt":"Dimension","entity":"@s","color":"yellow"},"]"]}]}

tag @s remove who_wants_runner_pos