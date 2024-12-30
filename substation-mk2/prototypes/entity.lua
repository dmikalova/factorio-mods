local mklv_deep_copy = require("__mklv-lib__.deep-copy")
local tint = { r = 178 / 255, g = 173 / 255, b = 100 / 255 }


local substation_mk2 = mklv_deep_copy("electric-pole", "substation")

substation_mk2.name = "substation-mk2"
substation_mk2.maximum_wire_distance = 22
substation_mk2.supply_area_distance = 11
substation_mk2.icons = { { icon = "__base__/graphics/icons/substation.png", tint = tint } }

data:extend { substation_mk2 }
