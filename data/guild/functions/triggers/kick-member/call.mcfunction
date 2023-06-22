scoreboard players reset @s guild.kick-member

say @s triggered kick member!

#getting the current team storage
function guild:manager/get-team-storage/call
# cyclling to the member
data modify storage guild:func/manager/cycle-to-member.in memberList set from storage guild:func/manager/get-team-storage.out
function guild:manager/cycle-to-member/with-this-player-name
execute store result score $internal.isMemberFound guild.internal run function guild:manager/cycle-to-member/call


execute if score $internal.isMemberFound guild.internal matches 0 run tellraw @s [{"text": "Unexpected error occured: couldn't find the player on the members list. \n This is unintentional, it's a bug!", "bold": true, "color": "red"}]
execute if score $internal.isMemberFound guild.internal matches 0 run return 0


#declare storage guild:triggers/kick-member.internal

data merge storage guild:triggers/kick-member.internal {owner: 'owner'}
execute store success score $internal.kick-member.isNotOwner guild.internal run data modify storage guild:triggers/kick-member.internal owner set from storage guild:func/manager/cycle-to-member.in memberList[0].rank

execute if score $internal.kick-member.isNotOwner guild.internal matches 1 run tellraw @s {"text": "You rank does not allow you to kick guild members!", "color": "red"}
execute if score $internal.kick-member.isNotOwner guild.internal matches 1 run return 0