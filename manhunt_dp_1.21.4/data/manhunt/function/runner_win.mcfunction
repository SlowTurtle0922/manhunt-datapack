#stop the game
scoreboard players set @a is_game_started 2

#show runner win
title @a title {"text": "Runners","color":"green","extra": [{"text": " Win!","color": "yellow"}]}
title @a subtitle {"text": "Runners","color":"green","extra": [{"text": " killed the dragon!","color": "white"}]}