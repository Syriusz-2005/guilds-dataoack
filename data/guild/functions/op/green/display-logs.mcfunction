

tag @s add guild.active-log-displayer

tellraw @s [{"text": "\n\n"}, {"text": "Displaying archived guild logs:"}]

tellraw @s [{"text": "------------"}]

data merge storage guild:func/display-logs.internal {logArray: []}
data modify storage guild:func/display-logs.internal logArray set from storage guild:green.logs logArray
function guild:logs/display/call

tellraw @s [{"text": "------------ \n"}]


tag @s remove guild.active-log-displayer