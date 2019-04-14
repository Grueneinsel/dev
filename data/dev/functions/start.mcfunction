execute as @e[tag=start,limit=1] store result score x int run data get entity @s Pos[0] 1
execute as @e[tag=start,limit=1] store result score z int run data get entity @s Pos[2] 1
execute as @e[tag=start,limit=1] at @s run worldborder center ~ ~
worldborder set 4000
gamerule doDaylightCycle true
gamerule doWeatherCycle true
weather clear
time set 6000
scoreboard players set day int 0
difficulty normal
tag @e[tag=start,limit=1] add running
function dev:set
scoreboard players set int day 0
scoreboard players set * playtime 0
scoreboard players set * rejoinperday 0
function dev:spawnaec
