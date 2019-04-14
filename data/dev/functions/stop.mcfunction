tag @e remove running
difficulty peaceful
time set 6000
function dev:teamremove
weather clear
gamerule doWeatherCycle false
gamerule doDaylightCycle false
scoreboard players set int day 0
scoreboard players set * playtime 0
scoreboard players set * rejoinperday 0
kill @e[tag=idaec]
scoreboard players set @e[tag=start,limit=1] spawn 0
