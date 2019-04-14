scoreboard objectives add id dummy
scoreboard objectives add team dummy
scoreboard objectives add int dummy
scoreboard objectives add wbx dummy
scoreboard objectives add wby dummy
scoreboard objectives add wbz dummy
scoreboard objectives add w1 dummy
scoreboard objectives add w2 dummy
scoreboard objectives add w3 dummy
scoreboard objectives add w4 dummy
scoreboard objectives add firstjoin dummy
scoreboard objectives add day dummy
scoreboard objectives add rejoin minecraft.custom:minecraft.leave_game
scoreboard objectives add playtime dummy
scoreboard objectives add playtimesec dummy
scoreboard objectives add playtimemin dummy
scoreboard objectives add rejoinperday dummy
scoreboard objectives add spawn dummy
scoreboard objectives add idaec dummy
scoreboard objectives add temp dummy
scoreboard objectives add dim dummy
scoreboard objectives add rp trigger
scoreboard players set 2 int 2
scoreboard players set -1 int -1
scoreboard players set 20 int 20
scoreboard players set 60 int 60
scoreboard players set 24000 int 24000


function dev:teamlist
function dev:id
scoreboard players add @a playtime 0
function dev:azp
execute as @a[scores={rejoin=1}] run scoreboard players operation @s playtimesec = 24000 int
execute as @a[scores={rejoin=1}] run scoreboard players operation @s playtimesec -= @s playtime
execute as @a[scores={rejoin=1}] run scoreboard players operation @s playtimesec /= 20 int
execute as @a[scores={rejoin=1}] run scoreboard players operation @s playtimemin = @s playtimesec
execute as @a[scores={rejoin=1}] run scoreboard players operation @s playtimesec %= 60 int
execute as @a[scores={rejoin=1}] run scoreboard players operation @s playtimemin /= 60 int
execute as @a[scores={rejoin=1}] run tellraw @s ["",{"text":"[BB] ","color":"gold"},{"text":"Welcome back! You have ","color":"white"},{"score":{"name":"@s","objective":"playtimemin"},"color":"gold"},{"text":" minutes ","color":"gold"},{"text":"and ","color":"white"},{"score":{"name":"@s","objective":"playtimesec"},"color":"gold"},{"text":" seconds ","color":"gold"},{"text":"of playing time left. Allowed relogs today: ","color":"white"},{"score":{"name":"@s","objective":"rejoinperday"},"color":"gold"}]
#execute as @a[scores={rejoin=1}] run tellraw @s ["",{"text":"[BB] ","color":"gold"},{"text":"Welcome back! You have ","color":"white"},{"score":{"name":"@s","objective":"playtimemin"},"color":"gold"},{"text":" minutes ","color":"gold"},{"text":"and ","color":"white"},{"score":{"name":"@s","objective":"playtimesec"},"color":"gold"},{"text":" seconds ","color":"gold"},{"text":"of playing time left.","color":"white"}]
execute as @a[scores={rejoin=1}] run tellraw @s ["",{"text":"[BB] ","color":"gold"},{"text":"Your distance to the world border: ","color":"white"},{"score":{"name":"@s","objective":"w1"},"color":"gold"},{"text":" blocks","color":"gold"}]
tag @a[scores={rejoin=1}] remove active

execute as @a run scoreboard players operation @s team = @s id
execute as @a run scoreboard players operation @s team /= 2 int
function dev:teamjoin
execute store result score wb int run worldborder get
scoreboard players operation wb int /= 2 int
scoreboard players set @a rejoin 0
execute as @e[tag=start,limit=1] store result score x int run data get entity @s Pos[0] 1
execute as @e[tag=start,limit=1] store result score z int run data get entity @s Pos[2] 1
scoreboard players add @a id 0
tag @a[scores={id=1}] add admin

execute as @e[tag=idaec] run data merge entity @s {Duration:200000000}
