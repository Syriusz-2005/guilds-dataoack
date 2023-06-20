#declare storage guild:func/utils/get-player-name.out {name: string}

function guild:utils/get-player-name/store
data modify storage guild:func/utils/get-player-name.out name set from block -30000000 0 1604 Items[{Slot:0b}].tag.SkullOwner.Name