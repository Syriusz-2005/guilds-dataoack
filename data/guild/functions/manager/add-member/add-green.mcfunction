#declare storage guild:func/manager/add-member.in {rank: "member" | "owner"}

#declare storage guild:func/manager/add-member.internal
#declare score_holder $func/manager/add-member.isOwner


function guild:utils/get-player-name/call
data merge storage guild:func/manager/add-member.internal {name: "", rank: "member"}

execute store success score $func/manager/add-member.isOwner guild.internal run data modify storage guild:func/manager/add-member.internal rank set from storage guild:func/manager/add-member.in rank


execute if score $func/manager/add-member.isOwner guild.internal matches 1 run data modify storage guild:func/manager/add-member.internal rank set value "owner"
data modify storage guild:func/manager/add-member.internal name set from storage guild:func/utils/get-player-name.out name
data modify storage guild:green.members memberList append from storage guild:func/manager/add-member.internal
