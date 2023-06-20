#@with side effects - modifies member list storage
#declare storage guild:func/manager/remove-member.internal
#declare score_holder $func/manager/remove-member.iterator

function guild:utils/get-player-name/call
data merge storage guild:func/manager/remove-member.internal {name: ""}
data modify storage guild:func/manager/remove-member.internal name set from storage guild:func/utils/get-player-name.out name

#@team specific
data modify storage guild:func/manager/remove-member.internal memberList set from storage guild:green.members memberList


data merge storage guild:func/manager/cycle-to-member.in {memberList: [], name: ""}
data modify storage guild:func/manager/cycle-to-member.in name set from storage guild:func/manager/remove-member.internal name
function guild:manager/cycle-to-member/call


execute if score $guild.func/manager.cycle-to-member.result guild.internal matches 0 run tellraw @s {"text": "Unexpeted error occured: couldn't find @s player in the members storage.", "color": "red", "bold": true}
execute if score $guild.func/manager.cycle-to-member.result guild.internal matches 0 run return 0


data remove storage guild:func/manager/remove-member.internal memberList[0]
data modify storage guild:green.members memberList set from storage guild:func/manager/remove-member.internal memberList