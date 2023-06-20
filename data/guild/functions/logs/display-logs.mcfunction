#declare storage guild:func/display-logs.internal {logArray: string[]}
#declare tag guild.active-log-displayer
#declare score_holder $guild.logs/display/timestamp
#declare score_holder $guild.logs/display/diff difference in ticks between now and message time

#deprecated!!

# It is vulnerable to time shift due to the server lags
execute store result score $guild.logs/display/timestamp guild.internal run data get storage guild:func/display-logs.internal logArray[0].timestamp 

scoreboard players operation $guild.logs/display/diff guild.internal = $guild.time guild.time
scoreboard players operation $guild.logs/display/diff guild.internal -= $guild.logs/display/timestamp guild.internal


#declare score_holder $guild.logs/display/diff-seconds
#declare score_holder $guild.logs/display/diff-minutes
#declare score_holder $guild.logs/display/diff-hours
#declare score_holder $guild.logs/display/diff-days
#declare score_holder $guild.logs/display/diff-months

scoreboard players operation $guild.logs/display/diff-seconds guild.internal = $guild.logs/display/diff guild.internal
scoreboard players operation $guild.logs/display/diff-seconds guild.internal /= $guild.20 guild.internal

scoreboard players operation $guild.logs/display/diff-minutes guild.internal = $guild.logs/display/diff-seconds guild.internal
scoreboard players operation $guild.logs/display/diff-minutes guild.internal /= $guild.60 guild.internal

scoreboard players operation $guild.logs/display/diff-hours guild.internal = $guild.logs/display/diff-minutes guild.internal
scoreboard players operation $guild.logs/display/diff-hours guild.internal /= $guild.60 guild.internal

scoreboard players operation $guild.logs/display/diff-days guild.internal = $guild.logs/display/diff-hours guild.internal
scoreboard players operation $guild.logs/display/diff-days guild.internal /= $guild.24 guild.internal

scoreboard players operation $guild.logs/display/diff-months guild.internal = $guild.logs/display/diff-days guild.internal
scoreboard players operation $guild.logs/display/diff-months guild.internal /= $guild.30 guild.internal

data merge storage guild:func/utils/freeze-string.in {str: '{"score": {"name": "$guild.logs/display/diff-seconds", "objective": "guild.internal"}}'}
function guild:utils/freeze-string/call

tellraw @a[tag=guild.active-log-displayer] [{"nbt": "str", "storage": "guild:func/utils/freeze-string.out", "interpret": true}, {"nbt": "logArray[0].message", "storage": "guild:func/display-logs.internal", "interpret": true, "bold": false}]


data remove storage guild:func/display-logs.internal logArray[0]

execute if data storage guild:func/display-logs.internal logArray[0] run function guild:logs/display-logs