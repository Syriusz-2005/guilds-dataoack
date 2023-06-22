#declare storage guild:func/manager/cycle-to-member.in {memberList: Member[], name: string}
#declare storage guild:func/manager/cycle-to-member.out {success: 0 | 1}


#declare score_holder $guild.func.manager.cycle-to-member.matchNotFound
#declare score_holder $guild.func.manager.cycle-to-member.memberArrayLength
#declare score_holder $guild.func.manager.cycle-to-member.index

scoreboard players set $guild.func.manager.cycle-to-member.index guild.internal 0
execute store result score $guild.func.manager.cycle-to-member.memberArrayLength guild.internal run data get storage guild:func/manager/cycle-to-member.in memberList

function guild:manager/cycle-to-member/cycle

execute store result storage guild:func/manager/cycle-to-member.out success int 1.0 run scoreboard players get $guild.func/manager.cycle-to-member.result guild.internal

execute if score $guild.func/manager.cycle-to-member.result guild.internal matches 1 run return 1
return 0
