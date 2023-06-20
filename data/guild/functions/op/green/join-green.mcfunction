#declare tag guild.player-joining

execute if entity @s[team=green] run tellraw @s {"text": "You can't join the guild you are currently in", "color": "red"}
execute if entity @s[team=green] run return 0

execute if predicate guild:in-any-team run tellraw @s {"text": "To join another guild you must leave you current guild first!", "color": "red"}
execute if predicate guild:in-any-team run return 0

tag @s add guild.player-joining
team join green @s

data merge storage guild:func/utils/freeze-string.in {str: '[{"selector": "@a[tag=guild.player-joining,limit=1]"}, {"text": " joined your guild!"}]'}
function guild:utils/freeze-string/call

data merge storage guild:func/logs/add-log.in {log: {type: "guild:log/join", message: ''}, guild: "green"}
data modify storage guild:func/logs/add-log.in log.message set from storage guild:func/utils/freeze-string.out str
function guild:logs/add-log


data merge storage guild:func/manager/add-member.in {rank: "member"}
function guild:manager/add-member/add-green

tag @s remove guild.player-joining