gamerule doDaylightCycle true
gamerule doWeatherCycle true
scoreboard players add day int 1
scoreboard players operation @e[tag=start,limit=1] day = day int
execute if entity @e[tag=start,limit=1,scores={day=4..23}] run worldborder add -175 0
scoreboard players set * playtime 0
function dev:set
scoreboard players set * rejoinperday 0
