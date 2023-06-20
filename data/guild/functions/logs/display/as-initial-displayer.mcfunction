tag @s remove guild.func.display-logs.newly-created-displayer
#declare score_holder $guild.logs/display/diff difference in ticks between now and message time

execute store result score @s guild.internal.logs-display.timestamp run data get storage guild:func/display-logs.internal logArray[0].timestamp

scoreboard players operation $guild.logs/display/diff guild.internal = $guild.time guild.time
scoreboard players operation $guild.logs/display/diff guild.internal -= @s guild.internal.logs-display.timestamp


scoreboard players operation @s guild.internal.logs-display.diff-seconds = $guild.logs/display/diff guild.internal
scoreboard players operation @s guild.internal.logs-display.diff-seconds /= $guild.20 guild.internal

scoreboard players operation @s guild.internal.logs-display.diff-minutes = @s guild.internal.logs-display.diff-seconds
scoreboard players operation @s guild.internal.logs-display.diff-minutes /= $guild.60 guild.internal

scoreboard players operation @s guild.internal.logs-display.diff-hours = @s guild.internal.logs-display.diff-minutes
scoreboard players operation @s guild.internal.logs-display.diff-hours /= $guild.60 guild.internal


execute if score @s guild.internal.logs-display.diff-seconds matches ..60 run function guild:logs/display/display-seconds
execute if score @s guild.internal.logs-display.diff-seconds matches ..60 run return 0

execute if score @s guild.internal.logs-display.diff-minutes matches ..60 run function guild:logs/display/display-minutes
execute if score @s guild.internal.logs-display.diff-minutes matches ..60 run return 0

execute if score @s guild.internal.logs-display.diff-hours matches ..24 run function guild:logs/display/display-hours
execute if score @s guild.internal.logs-display.diff-hours matches ..24 run return 0


function guild:logs/display/display-days
