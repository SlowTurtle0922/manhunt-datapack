#item replace entity @s weapon.mainhand with minecraft:compass[lodestone_tracker={target:{dimension:"minecraft:the_nether",pos:[0,0,0]},tracked:false}]
#execute if items entity @s hotbar.0 compass store result entity @s Inventory[0].components.'"lodestone_tracker"'.target.pos:[0] int 1 run data get entity @a[limit=1,team=runner,sort=nearest] enteredNetherPosition.x
#
#
#data get entity @s enteredNetherPosition