local mklv_consts = require("__mklv-lib__.consts")
local name = "mklv-roboport-mk2"

--[[ Overview

Adds a Roboport Mk2 that can be chunk aligned in a 64x64 grid:
- Increases the supply area from 50x50 to 64x64
- Increases the construction construction area from 110x110 to 138x138
- Increases the radar range from 2 to 4
- Increases the robot and items slots from 7 to 10
- Increases the energy stats from 1x to 2x
- Increases the number of robot charging slots with quality
- Assembled in cryogenic lab on gleb

]]--

--[[ Entity ]] --
local entity = table.deepcopy(data.raw["roboport"]["roboport"])

entity.door_animation_down.tint = mklv_consts.tints.mk2
entity.door_animation_up.tint = mklv_consts.tints.mk2
entity.base_animation.tint = mklv_consts.tints.mk2
entity.base_patch.tint = mklv_consts.tints.mk2
entity.base.layers[1].tint = mklv_consts.tints.mk2
entity.charging_offsets = {
  -- circle with 16 points of radius 2
  -- top right
  { 0,      2 },
  { 0.749,  1.854 },
  { 1.414,  1.414 },
  { 1.854,  0.749 },
  -- bottom right
  { 2,      0 },
  { 1.854,  -0.749 },
  { 1.414,  -1.414 },
  { 0.749,  -1.854 },
  -- bottom left
  { 0,      -2 },
  { -0.749, -1.854 },
  { -1.414, -1.414 },
  { -1.854, -0.749 },
  -- top left
  { -2,     0 },
  { -1.854, 0.749 },
  { -1.414, 1.414 },
  { -0.749, 1.854 },
}
entity.charging_station_count_affected_by_quality = true
entity.construction_radius = 69
entity.corpse = name .. "-remnants"
entity.icons = { {
  icon = "__base__/graphics/icons/roboport.png",
  tint = mklv_consts.tints.mk2
} }
entity.logistics_radius = 32
entity.material_slots_count = 10
entity.name = name
entity.radar_range = 4
entity.robot_slots_count = 10

entity.charging_energy = "1MW"
entity.energy_source.buffer_capacity = "200MJ"
entity.energy_source.input_flow_limit = "10MW"
entity.energy_usage = "100kW"
entity.recharge_minimum = "80MJ"

--[[ Item ]] --
local item = table.deepcopy(data.raw.item["roboport"])

item.icons = { {
  icon = "__base__/graphics/icons/roboport.png",
  tint = mklv_consts.tints.mk2
} }
item.name = name
item.order = "c[signal]-a[roboport]am2"
item.place_result = name

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["roboport"])

recipe.name = name
recipe.category_id = "cryogenics"
recipe.ingredients = {
  { type = "item", name = "roboport",          amount = 1 },
  { type = "item", name = "lithium-plate",     amount = 5 },
  { type = "item", name = "quantum-processor", amount = 5 },
}
recipe.results = { {
  amount = 1,
  name = name,
  type = "item",
} }
recipe.surface_conditions = {
  mklv_consts.surface_conditions.pressure.gleba,
}

--[[ Remnants ]] --
local remnants = table.deepcopy(data.raw["corpse"]["roboport-remnants"])
remnants.name = name .. "-remnants"
remnants.animation[1].tint = mklv_consts.tints.mk2
remnants.animation[2].tint = mklv_consts.tints.mk2

--[[ Technology ]] --
local technology = table.deepcopy(data.raw.technology["logistic-robotics"])

technology.effects = { {
  type = "unlock-recipe",
  recipe = name
} }
technology.icons = { {
  icon = "__base__/graphics/technology/logistic-robotics.png",
  icon_size = 256,
  tint = mklv_consts.tints.mk2,
} }
technology.name = name
technology.prerequisites = {
  "logistic-system",
  "quantum-processor",
}
technology.unit = {
  count = 20000,
  ingredients = {
    { "automation-science-pack",      1 },
    { "logistic-science-pack",        1 },
    -- { "military-science-pack",        1 },
    { "chemical-science-pack",        1 },
    { "production-science-pack",      1 },
    { "utility-science-pack",         1 },
    { "space-science-pack",           1 },
    { "metallurgic-science-pack",     1 },
    { "electromagnetic-science-pack", 1 },
    { "agricultural-science-pack",    1 },
    { "cryogenic-science-pack",       1 },
    -- { "prometheum-science-pack",       1 },
  },
  time = 30
}

--[[ Export ]] --
data:extend {
  entity,
  item,
  recipe,
  remnants,
  technology,
}

--[[ Modify ]] --
data.raw["roboport"]["roboport"].next_upgrade = name
