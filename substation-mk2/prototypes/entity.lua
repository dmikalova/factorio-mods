local mklv_deep_copy = require("__mklv-lib__.deep-copy")

local substation_mk2 = mklv_deep_copy("electric-pole", "substation")

substation_mk2.name = "substation-mk2"
substation_mk2.maximum_wire_distance = 22
substation_mk2.supply_area_distance = 11

data:extend { substation_mk2 }
