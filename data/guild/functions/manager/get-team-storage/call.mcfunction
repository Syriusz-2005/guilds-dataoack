#declare storage guild:func/manager/get-team-storage.out {memberList: Member[]}
#in: @s[team=any]

#@team specific

execute if entity @s[team=green] run data modify storage guild:func/manager/get-team-storage.out memberList set from storage guild:green.members memberList
execute if entity @s[team=green] run return 1

execute if entity @s[team=blue] run data modify storage guild:func/manager/get-team-storage.out memberList set from storage guild:blue.members memberList
execute if entity @s[team=blue] run return 1

execute if entity @s[team=red] run data modify storage guild:func/manager/get-team-storage.out memberList set from storage guild:red.members memberList
execute if entity @s[team=red] run return 1

execute if entity @s[team=white] run data modify storage guild:func/manager/get-team-storage.out memberList set from storage guild:white.members memberList
execute if entity @s[team=white] run return 1