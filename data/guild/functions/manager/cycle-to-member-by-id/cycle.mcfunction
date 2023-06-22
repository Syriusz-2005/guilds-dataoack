#declare score_holder $guild.func/manager.cycle-to-member-by-id.result

execute if score $guild.func.manager.cycle-to-member-by-id.index guild.internal >= $guild.func.manager.cycle-to-member-by-id.memberArrayLength guild.internal run return 0

data modify storage guild:func/manager/cycle-to-member-by-id.in currentMember set from storage guild:func/manager/cycle-to-member-by-id.in memberList[0]
execute store success score $guild.func.manager.cycle-to-member-by-id.matchNotFound guild.internal run data modify storage guild:func/manager/cycle-to-member-by-id.in currentMember.id set from storage guild:func/manager/cycle-to-member-by-id.in id


execute if score $guild.func.manager.cycle-to-member-by-id.matchNotFound guild.internal matches 0 run scoreboard players set $guild.func/manager.cycle-to-member-by-id.result guild.internal 1
execute if score $guild.func.manager.cycle-to-member-by-id.matchNotFound guild.internal matches 0 run return 1

data modify storage guild:func/manager/cycle-to-member-by-id.in memberList append from storage guild:func/manager/cycle-to-member-by-id.in memberList[0]
data remove storage guild:func/manager/cycle-to-member-by-id.in memberList[0]

scoreboard players add $guild.func.manager.cycle-to-member-by-id.index guild.internal 1

execute store result score $guild.func/manager.cycle-to-member-by-id.result guild.internal run function guild:manager/cycle-to-member-by-id/cycle

execute if score $guild.func/manager.cycle-to-member-by-id.result guild.internal matches 1 run return 1
return 0