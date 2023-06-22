#declare storage guild:func/manager/cycle-to-member-by-id.in {memberList: Member[], id: Int}


#declare score_holder $guild.func.manager.cycle-to-member-by-id.matchNotFound
#declare score_holder $guild.func.manager.cycle-to-member-by-id.memberArrayLength
#declare score_holder $guild.func.manager.cycle-to-member-by-id.index

scoreboard players set $guild.func.manager.cycle-to-member-by-id.index guild.internal 0
execute store result score $guild.func.manager.cycle-to-member-by-id.memberArrayLength guild.internal run data get storage guild:func/manager/cycle-to-member-by-id.in memberList

function guild:manager/cycle-to-member-by-id/cycle

execute if score $guild.func/manager.cycle-to-member-by-id.result guild.internal matches 1 run return 1
return 0
