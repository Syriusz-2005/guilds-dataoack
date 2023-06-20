#declare tag guild.func.display-logs.newly-created-displayer
#declare tag guild.func.display-logs.active-displayers

summon marker ~ ~ ~ {Tags:["guild.func.display-logs.active-displayers", "guild.func.display-logs.newly-created-displayer"]}
execute as @e[tag=guild.func.display-logs.newly-created-displayer,limit=1] run function guild:logs/display/as-initial-displayer

data remove storage guild:func/display-logs.internal logArray[0]
execute if data storage guild:func/display-logs.internal logArray[0] run function guild:logs/display/summon-displayers-r

