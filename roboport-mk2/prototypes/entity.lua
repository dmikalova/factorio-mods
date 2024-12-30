local mklv_deep_copy = require("__mklv-lib__.deep-copy")
local tint = { r = 178 / 255, g = 173 / 255, b = 100 / 255 }

local roboport_mk2 = mklv_deep_copy("roboport", "roboport")

roboport_mk2.name = "roboport-mk2"
roboport_mk2.fast_replaceable_group = "roboport"
roboport_mk2.supply_area_distance = 11

roboport_mk2.logistics_radius = 54
roboport_mk2.construction_radius = 118
roboport_mk2.charging_station_count_affected_by_quality = true


roboport_mk2.icons = { { icon = "__base__/graphics/icons/roboport.png", tint = tint } }

roboport_mk2.energy_source = {
  type = "electric",
  usage_priority = "secondary-input",
  input_flow_limit = "16MW",
  buffer_capacity = "600MJ"
}
roboport_mk2.recharge_minimum = "240MJ"
roboport_mk2.energy_usage = "300kW"
roboport_mk2.charging_energy = "1MW"
roboport_mk2.robot_slots_count = 8
-- roboport_mk2.material_slots_count = 8
roboport_mk2.charging_offsets = {
  { -1.5, 1.5 },
  { -1.5, -1.5 },
  { -1.5, 0 },
  { 0,    -1.5 },
  { 0,    1.5 },
  { 1.5,  -1.5 },
  { 1.5,  0 },
  { 1.5,  1.5 },
}


data:extend { roboport_mk2 }
