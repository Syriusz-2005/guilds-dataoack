#declare storage guild:func/manager/list-members.internal {memberList: Member[]}

tellraw @s [{"text": "- "},{"nbt": "memberList[0].name", "storage": "guild:func/manager/list-members.internal", "clickEvent": {"action": "run_command","value": "/tellraw @a \"In the future you'll be able to kick players by clicking here\""}}, {"text": " rank: "}, {"nbt": "memberList[0].rank", "storage": "guild:func/manager/list-members.internal"}]

data remove storage guild:func/manager/list-members.internal memberList[0]

execute if data storage guild:func/manager/list-members.internal memberList[0] run function guild:manager/list-members/list-members-r