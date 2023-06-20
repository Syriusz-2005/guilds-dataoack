

tellraw @a[tag=guild.active-log-displayer] [{"text": "["},{"score": {"name": "@s", "objective": "guild.internal.logs-display.diff-minutes"}}, {"text": " minute(s) ago]: "}, {"nbt": "logArray[0].message", "storage": "guild:func/display-logs.internal", "interpret": true, "bold": false}]
