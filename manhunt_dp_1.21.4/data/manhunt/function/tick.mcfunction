#check if the game has started
scoreboard players enable @a start
execute as @a[scores={start=1}] run function manhunt:start

#if game started
execute if entity @a[scores={is_game_started=1}] run function manhunt:game_running