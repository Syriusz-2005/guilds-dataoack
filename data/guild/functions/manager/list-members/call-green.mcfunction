#declare storage guild:func/manager/list-members.in {}

#declare storage guild:green.members {memberList: {name: string, rank: "member" | "owner"}[]}
#declare storage guild:red.members
#declare storage guild:blue.members
#declare storage guild:white.members




tellraw @s [{"text": "\n\n---------------", "color": "white"}]
tellraw @s [{"text": "Displaying the guild members list:\n", "color": "white"}]
#@team specific
data modify storage guild:func/manager/list-members.internal memberList set from storage guild:green.members memberList
function guild:manager/list-members/list-members-r
tellraw @s [{"text": "---------------\n", "color": "white"}]
