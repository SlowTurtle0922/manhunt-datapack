#help players to know how to start the game
execute as @a[tag=] run function manhunt:welcome
tag @a[tag=] add in_game

#check if the game has started
scoreboard players enable @a start
execute as @a[scores={start=1}] run function manhunt:start

#if game started
execute if entity @a[scores={is_game_started=1}] run function manhunt:game_running