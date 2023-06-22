#declare score_holder $guild.func/manager.cycle-to-member.result

execute if score $guild.func.manager.cycle-to-member.index guild.internal >= $guild.func.manager.cycle-to-member.memberArrayLength guild.internal run return 0

data modify storage guild:func/manager/cycle-to-member.in currentMember set from storage guild:func/manager/cycle-to-member.in memberList[0]
execute store success score $guild.func.manager.cycle-to-member.matchNotFound guild.internal run data modify storage guild:func/manager/cycle-to-member.in currentMember.name set from storage guild:func/manager/cycle-to-member.in name


execute if score $guild.func.manager.cycle-to-member.matchNotFound guild.internal matches 0 run scoreboard players set $guild.func/manager.cycle-to-member.result guild.internal 1
execute if score $guild.func.manager.cycle-to-member.matchNotFound guild.internal matches 0 run return 1

data modify storage guild:func/manager/cycle-to-member.in memberList append from storage guild:func/manager/cycle-to-member.in memberList[0]
data remove storage guild:func/manager/cycle-to-member.in memberList[0]

scoreboard players add $guild.func.manager.cycle-to-member.index guild.internal 1

execute store result score $guild.func/manager.cycle-to-member.result guild.internal run function guild:manager/cycle-to-member/cycle

execute if score $guild.func/manager.cycle-to-member.result guild.internal matches 1 run return 1
return 0