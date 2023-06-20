forceload add -30000000 1604 -30000000 1605
setblock -30000000 0 1604 shulker_box
setblock -30000000 0 1605 oak_sign


team add green {"text": "Green", "color": "green"}
team modify green color green

team add red {"text": "Red", "color": "red"}
team modify red color red

team add blue {"text": "Blue", "color": "blue"}
team modify blue color blue

team add white {"text": "White", "color": "white"}
team modify white color white

#declare score_holder $guild.20
scoreboard players set $guild.20 guild.internal 20

#declare score_holder $guild.24
scoreboard players set $guild.24 guild.internal 24

#declare score_holder $guild.30
scoreboard players set $guild.30 guild.internal 30

#declare score_holder $guild.60
scoreboard players set $guild.60 guild.internal 60



scoreboard objectives add guild.internal dummy

scoreboard objectives add guild.world-time custom:total_world_time
scoreboard objectives add guild.time dummy
#declare score_holder $guild.time

scoreboard objectives add guild.internal.logs-display.diff-seconds dummy
scoreboard objectives add guild.internal.logs-display.diff-minutes dummy
scoreboard objectives add guild.internal.logs-display.diff-hours dummy
scoreboard objectives add guild.internal.logs-display.diff-days dummy

scoreboard objectives add guild.internal.logs-display.timestamp dummy
