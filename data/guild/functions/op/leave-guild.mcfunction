#declare tag guild.player-leaving

tag @s add guild.player-leaving

#@team specific
execute if entity @s[team=green] run function guild:manager/remove-member/call-green

data merge storage guild:func/utils/freeze-string.in {str: '[{"selector": "@a[tag=guild.player-leaving,limit=1]", "color": "red"}, {"text": " left your guild!", "color": "red"}]'}
function guild:utils/freeze-string/call

data merge storage guild:func/logs/add-log.in {log: {type: "guild:log/leave", message: ''}, guild: ""}
data modify storage guild:func/logs/add-log.in log.message set from storage guild:func/utils/freeze-string.out str

#@team specific
execute if entity @s[team=green] run data modify storage guild:func/logs/add-log.in guild set value green
execute if entity @s[team=red] run data modify storage guild:func/logs/add-log.in guild set value red
execute if entity @s[team=blue] run data modify storage guild:func/logs/add-log.in guild set value blue
execute if entity @s[team=white] run data modify storage guild:func/logs/add-log.in guild set value white

function guild:logs/add-log

team leave @s
tag @s remove guild.player-leaving