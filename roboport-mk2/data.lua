local mklv_consts = require("__mklv-lib__.consts")

local name = "mklv-roboport-mk2"
local tint = mklv_consts.tints.acid

--[[ Entity ]] --
local entity = table.deepcopy(data.raw["roboport"]["roboport"])

entity.charging_station_count_affected_by_quality = true
entity.construction_radius = 69
entity.corpse = name .. "-remnants"
entity.logistics_radius = 32
entity.material_slots_count = 10
entity.minable.result = name
entity.name = name
entity.radar_range = 4
entity.robot_slots_count = 11

entity.charging_energy = "1MW"
entity.energy_source.buffer_capacity = "200MJ"
entity.energy_source.input_flow_limit = "10MW"
entity.energy_usage = "100kW"
entity.recharge_minimum = "80MJ"

entity.base_animation.tint = tint
entity.base_patch.tint = tint
entity.base.layers[1].tint = tint
entity.door_animation_down.tint = tint
entity.door_animation_up.tint = tint

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
entity.icons = { {
  icon = "__base__/graphics/icons/roboport.png",
  tint = tint
} }

--[[ Item ]] --
local item = table.deepcopy(data.raw.item["roboport"])

item.name = name
item.order = "c[signal]-a[roboport]am2"
item.place_result = name

item.icons = { {
  icon = "__base__/graphics/icons/roboport.png",
  tint = tint
} }

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["roboport"])

recipe.autorecycle = false
recipe.category = "cryogenics"
recipe.name = name
recipe.surface_conditions = { mklv_consts.surface_conditions.pressure.fulgora }

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

--[[ Remnants ]] --
local remnants = table.deepcopy(data.raw["corpse"]["roboport-remnants"])

remnants.animation[1].tint = tint
remnants.animation[2].tint = tint
remnants.name = name .. "-remnants"

--[[ Technology ]] --
local technology = table.deepcopy(data.raw.technology["logistic-robotics"])

technology.name = name

technology.effects = { {
  type = "unlock-recipe",
  recipe = name
} }
technology.icons = { {
  icon = "__base__/graphics/technology/logistic-robotics.png",
  icon_size = 256,
  tint = tint,
} }
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
