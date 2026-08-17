#stop the game
scoreboard players set @a is_game_started 2

#show hunter win
title @a title {"text": "Hunters","color":"red","extra": [{"text": " Win!","color": "yellow"}]}
title @a subtitle {"text": "Runners","color":"green","extra": [{"text": " are all dead!","color": "white"}]}