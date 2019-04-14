tp @e[type=minecraft:phantom] ~ ~-200 ~
scoreboard players add @a firstjoin 1
scoreboard players set @e[scores={firstjoin=2}] rejoin 1
execute if entity @a[scores={rejoin=1}] run function dev:set

execute if entity @e[type=minecraft:armor_stand,tag=running] run function dev:isstarted
execute unless entity @e[type=minecraft:armor_stand,tag=running] run function dev:notstarted
