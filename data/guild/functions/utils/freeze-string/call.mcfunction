#declare storage guild:func/utils/freeze-string.in {str: string}
#declare storage guild:func/utils/freeze-string.out {str: string}
# freezes string by resolving dynamic string values into constant text (such as player names)

data modify block -30000000 0 1605 front_text.messages[0] set from storage guild:func/utils/freeze-string.in str
data modify storage guild:func/utils/freeze-string.out str set from block -30000000 0 1605 front_text.messages[0]
