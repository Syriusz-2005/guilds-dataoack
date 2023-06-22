
#getting the current team storage
function guild:manager/get-team-storage/call
# cyclling to the member
data modify storage guild:func/manager/cycle-to-member.in memberList set from storage guild:func/manager/get-team-storage.out memberList
function guild:manager/cycle-to-member/with-this-player-name
# tellraw @s {"nbt": "name", "storage": "guild:func/manager/cycle-to-member.in"}
execute store result score $internal.isMemberFound guild.internal run function guild:manager/cycle-to-member/call


execute if score $internal.isMemberFound guild.internal matches 0 run tellraw @s [{"text": "Unexpected error occured: couldn't find the player on the members list. \n This is unintentional, it's a bug!", "bold": true, "color": "red"}]
execute if score $internal.isMemberFound guild.internal matches 0 run return 0


#declare storage guild:triggers/kick-member.internal

data merge storage guild:triggers/kick-member.internal {owner: 'owner'}
execute store success score $internal.kick-member.isNotOwner guild.internal run data modify storage guild:triggers/kick-member.internal owner set from storage guild:func/manager/cycle-to-member.in memberList[0].rank
# tellraw @s {"nbt": "memberList", "storage": "guild:func/manager/cycle-to-member.in"}
execute if score $internal.kick-member.isNotOwner guild.internal matches 1 run tellraw @s {"text": "Your rank does not allow you to kick guild members!", "color": "red"}
execute if score $internal.kick-member.isNotOwner guild.internal matches 1 run return 0

data modify storage guild:func/manager/cycle-to-member-by-id.in memberList set from storage guild:func/manager/get-team-storage.out memberList
execute store result storage guild:func/manager/cycle-to-member-by-id.in id int 1.0 run scoreboard players get @s guild.kick-member
execute store result score $internal.triggers.kick-member.isPlayerFound guild.internal run function guild:manager/cycle-to-member-by-id/call

execute if score $internal.triggers.kick-member.isPlayerFound guild.internal matches 0 run tellraw @s {"text": "The player couldn't be found!", "color": "red"}
execute if score $internal.triggers.kick-member.isPlayerFound guild.internal matches 0 run return 0

tellraw @s [{"text": "----------"}, {"text": "Action: "}, {"text": "kick player", "color": "red"}, {"text": "----------\n"}, {"text": "Player name: "}, {"nbt": "memberList[0].name", "storage": "guild:func/manager/cycle-to-member-by-id.in"}]
tellraw @s [{"text": "-----------------------------------"}]


data merge storage guild:func/logs/add-log.in {log: {type: "guild:log/kick",  message: '[{"nbt": "memberList[0].name", "storage": "guild:func/manager/cycle-to-member-by-id.in", "bold": true, "color": "red"}, {"text": " has been ", "color": "red"}, {"text": "kicked","color": "red"}, {"text": "!", "color": "red"}]'}, guild: "green"}
execute if entity @s[team=blue] run data modify storage guild:func/logs/add-log.in guild set value "blue"
execute if entity @s[team=red] run data modify storage guild:func/logs/add-log.in guild set value "red"
execute if entity @s[team=white] run data modify storage guild:func/logs/add-log.in guild set value "white"
function guild:logs/add-log