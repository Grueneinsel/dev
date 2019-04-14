execute at @e[tag=start,limit=1] run summon area_effect_cloud ~ ~ ~ {Duration:200000000,Tags:["idaec"]}
scoreboard players add @e[tag=idaec] idaec 1
execute unless entity @e[scores={idaec=100}] run function dev:spawnaec

scoreboard players add @e[tag=start,limit=1] spawn 1
tellraw @p ["",{"score":{"name":"@e[tag=start,limit=1]","objective":"spawn"}}]
