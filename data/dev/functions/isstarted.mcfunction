
#worldborder wbx= nähe zum spawn w1 = entfernung zur worldboarder
execute as @a store result score @s wbx run data get entity @s Pos[0] 1
execute as @a store result score @s wby run data get entity @s Pos[1] 1
execute as @a store result score @s wbz run data get entity @s Pos[2] 1
execute as @a run scoreboard players operation @s wbx -= x int
execute as @a run scoreboard players operation @s wbz -= z int
scoreboard players operation @a[scores={wbx=..-1}] wbx *= -1 int
scoreboard players operation @a[scores={wbz=..-1}] wbz *= -1 int
scoreboard players operation @a w1 = wb int
scoreboard players operation @a w2 = wb int
execute as @a run scoreboard players operation @s w1 -= @s wbx
execute as @a run scoreboard players operation @s w2 -= @s wbz
execute as @a run scoreboard players operation @s w1 < @s w2
execute as @a run scoreboard players operation @s wbx > @s wbz
execute as @a[scores={w1=..75}] run title @s actionbar ["",{"text":"Distance to world border: ","color":"white"},{"score":{"name":"@s","objective":"w1"},"color":"gold"},{"text":" blocks","color":"gold"}]
execute as @a[scores={wbx=4..}] at @s if block ~ ~ ~ minecraft:nether_portal run setblock ~ ~ ~ minecraft:air

#tellraws
execute as @a[scores={playtime=12000}] run tellraw @s ["",{"text":"[BB] ","color":"gold"},{"text":"Remaining playing time: ","color":"white"},{"text":"10 minutes","color":"gold"}]
execute as @a[scores={playtime=12000}] at @s run playsound minecraft:entity.arrow.hit_player master @s ~ ~ ~ 100000000000 1 1
execute as @a[scores={playtime=18000}] run tellraw @s ["",{"text":"[BB] ","color":"gold"},{"text":"Remaining playing time: ","color":"white"},{"text":"5 minutes","color":"gold"}]
execute as @a[scores={playtime=18000}] at @s run playsound minecraft:entity.arrow.hit_player master @s ~ ~ ~ 100000000000 1 1
execute as @a[scores={playtime=22800}] run tellraw @s ["",{"text":"[BB] ","color":"gold"},{"text":"Remaining playing time: ","color":"white"},{"text":"1 minutes","color":"gold"}]
execute as @a[scores={playtime=22800}] at @s run playsound minecraft:entity.arrow.hit_player master @s ~ ~ ~ 100000000000 1 1
execute as @a[scores={playtime=23400}] run tellraw @s ["",{"text":"[BB] ","color":"gold"},{"text":"Remaining playing time: ","color":"white"},{"text":"30 seconds","color":"gold"}]
execute as @a[scores={playtime=23400}] at @s run playsound minecraft:entity.arrow.hit_player master @s ~ ~ ~ 100000000000 1 1
execute as @a[scores={playtime=23800}] run tellraw @s ["",{"text":"[BB] ","color":"gold"},{"text":"Remaining playing time: ","color":"white"},{"text":"10 seconds","color":"gold"}]
execute as @a[scores={playtime=23800}] at @s run playsound minecraft:entity.arrow.hit_player master @s ~ ~ ~ 100000000000 1 1
execute as @a[scores={playtime=23900}] run tellraw @s ["",{"text":"[BB] ","color":"gold"},{"text":"Remaining playing time: ","color":"white"},{"text":"5 seconds","color":"gold"}]
execute as @a[scores={playtime=23900}] at @s run playsound minecraft:entity.arrow.hit_player master @s ~ ~ ~ 100000000000 1 1
execute as @a[scores={playtime=23940}] run tellraw @s ["",{"text":"[BB] ","color":"gold"},{"text":"Remaining playing time: ","color":"white"},{"text":"3 seconds","color":"gold"}]
execute as @a[scores={playtime=23940}] at @s run playsound minecraft:entity.arrow.hit_player master @s ~ ~ ~ 100000000000 1 1
execute as @a[scores={playtime=23960}] run tellraw @s ["",{"text":"[BB] ","color":"gold"},{"text":"Remaining playing time: ","color":"white"},{"text":"2 seconds","color":"gold"}]
execute as @a[scores={playtime=23960}] at @s run playsound minecraft:entity.arrow.hit_player master @s ~ ~ ~ 100000000000 1 1
execute as @a[scores={playtime=23980}] run tellraw @s ["",{"text":"[BB] ","color":"gold"},{"text":"Remaining playing time: ","color":"white"},{"text":"1 seconds","color":"gold"}]
execute as @a[scores={playtime=23980}] at @s run playsound minecraft:entity.arrow.hit_player master @s ~ ~ ~ 100000000000 1 1
execute as @a[scores={playtime=23999}] run tellraw @s ["",{"text":"[BB] ","color":"gold"},{"text":"Your daily playing time is ","color":"white"},{"text":"over","color":"gold"},{"text":"! You may play again ","color":"white"},{"text":"as of 12:00 a. m. (UTC+1)","color":"gold"},{"text":"!","color":"white"}]
execute as @a[scores={playtime=23999}] at @s run playsound minecraft:entity.arrow.hit_player master @s ~ ~ ~ 100000000000 0 1


#playtime
scoreboard players add @a[tag=active] playtime 1
tag @a[scores={playtime=24000..}] remove active
execute as @a store result score @s dim run data get entity @s Dimension 1
execute as @a[tag=!active,scores={dim=..0}] run tag @s add up
execute as @a[scores={dim=-1}] run tag @s add nether
execute as @a[scores={dim=0}] run tag @s remove nether
execute as @a[tag=up] at @s in minecraft:the_end run tp ~ ~ ~
execute as @a[tag=up] at @s run summon armor_stand ~ ~ ~ {Marker:1b,Tags:["tp"]}
execute if entity @a[tag=up] run schedule function dev:box 4s
execute as @a[tag=up] at @s run fill ~-2 ~-1 ~-2 ~2 ~3 ~2 minecraft:end_stone
execute as @a[tag=up] at @s run fill ~-1 ~ ~-1 ~1 ~2 ~1 minecraft:air
tag @a remove up
execute as @a[tag=active,scores={dim=1}] run tag @s add down
execute as @a[tag=down] at @s run kill @e[tag=tp,distance=..3,sort=nearest,limit=1]
gamemode survival @a[tag=down]
execute as @a[tag=down,tag=!nether] at @s in minecraft:overworld run tp ~ ~ ~
execute as @a[tag=down,tag=nether] at @s in minecraft:the_nether run tp ~ ~ ~
effect give @a[tag=!active,tag=!admin] minecraft:invisibility 1 1 true
tag @a remove down
effect give @a[tag=!active,tag=!admin] minecraft:mining_fatigue 1 1 true
gamemode adventure @a[tag=!active,tag=!admin]
execute as @a[tag=!active] at @s run tp @s @e[tag=tp,distance=..10,sort=nearest,limit=1]
effect give @a[tag=!active] minecraft:resistance 10 10 true
