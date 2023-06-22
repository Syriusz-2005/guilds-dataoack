

execute as @a run scoreboard players enable @s guild.kick-member
execute as @a[scores={guild.kick-member=1..}] run function guild:triggers/kick-member/call
execute as @a[scores={guild.kick-member=1..}] run scoreboard players reset @s guild.kick-member
