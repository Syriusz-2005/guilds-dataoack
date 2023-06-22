#declare storage guild:func/logs/add-log.in {log: {type: "guild:log/join" | "guild:log/leave", message: "JSON TEXT COMPONENT", timestamp?: int}, guild: "red" | "blue" | "green" | "white"}
#declare storage guild:func/logs/add-log.internal
#declare score_holder $func/logs/add-log.matchNotFound

#declare storage guild:green.logs
#declare storage guild:red.logs
#declare storage guild:blue.logs
#declare storage guild:white.logs

execute store result storage guild:func/logs/add-log.in log.timestamp int 1.0 run scoreboard players get $guild.time guild.time


#@team specific
data modify storage guild:func/logs/add-log.internal guildName set value "red"
execute store success score $func/logs/add-log.matchNotFound guild.internal run data modify storage guild:func/logs/add-log.internal guildName set from storage guild:func/logs/add-log.in guild

execute if score $func/logs/add-log.matchNotFound guild.internal matches 0 run tellraw @a[team=red] [{"text": "[guildlog] ", "bold": true}, {"nbt": "log.message", "storage": "guild:func/logs/add-log.in", "interpret": true, "bold": false, "color": "green"}]
execute if score $func/logs/add-log.matchNotFound guild.internal matches 0 run data modify storage guild:red.logs logArray prepend from storage guild:func/logs/add-log.in log
execute if score $func/logs/add-log.matchNotFound guild.internal matches 0 run return 0



data modify storage guild:func/logs/add-log.internal guildName set value "green"
execute store success score $func/logs/add-log.matchNotFound guild.internal run data modify storage guild:func/logs/add-log.internal guildName set from storage guild:func/logs/add-log.in guild

execute if score $func/logs/add-log.matchNotFound guild.internal matches 0 run tellraw @a[team=green] [{"text": "[guildlog] ", "bold": true}, {"nbt": "log.message", "storage": "guild:func/logs/add-log.in", "interpret": true, "bold": false, "color": "green"}]
execute if score $func/logs/add-log.matchNotFound guild.internal matches 0 run data modify storage guild:green.logs logArray prepend from storage guild:func/logs/add-log.in log
execute if score $func/logs/add-log.matchNotFound guild.internal matches 0 run return 0



data modify storage guild:func/logs/add-log.internal guildName set value "blue"
execute store success score $func/logs/add-log.matchNotFound guild.internal run data modify storage guild:func/logs/add-log.internal guildName set from storage guild:func/logs/add-log.in guild

execute if score $func/logs/add-log.matchNotFound guild.internal matches 0 run tellraw @a[team=blue] [{"text": "[guildlog] ", "bold": true}, {"nbt": "log.message", "storage": "guild:func/logs/add-log.in", "interpret": true, "bold": false, "color": "green"}]
execute if score $func/logs/add-log.matchNotFound guild.internal matches 0 run data modify storage guild:blue.logs logArray prepend from storage guild:func/logs/add-log.in log
execute if score $func/logs/add-log.matchNotFound guild.internal matches 0 run return 0



data modify storage guild:func/logs/add-log.internal guildName set value "white"
execute store success score $func/logs/add-log.matchNotFound guild.internal run data modify storage guild:func/logs/add-log.internal guildName set from storage guild:func/logs/add-log.in guild

execute if score $func/logs/add-log.matchNotFound guild.internal matches 0 run tellraw @a[team=white] [{"text": "[guildlog] ", "bold": true}, {"nbt": "log.message", "storage": "guild:func/logs/add-log.in", "interpret": true, "bold": false, "color": "green"}]
execute if score $func/logs/add-log.matchNotFound guild.internal matches 0 run data modify storage guild:white.logs logArray prepend from storage guild:func/logs/add-log.in log
execute if score $func/logs/add-log.matchNotFound guild.internal matches 0 run return 0



data remove storage guild:func/logs/add-log.in log
data remove storage guild:func/logs/add-log.in guild