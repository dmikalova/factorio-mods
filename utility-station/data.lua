local mklv_consts = require("__mklv-lib__.consts")
local mklv_combined_entity = require("__mklv-lib__/combined-entity")

local name = "mklv-utility-station"

--[[ Entity ]] --
local entity                     = table.deepcopy(data.raw["roboport"]["roboport"])
entity.name                      = name
entity.circuit_wire_max_distance = 25
entity.minable.result            = name
entity.corpse                    = name .. "-remnants"

entity.icons                     = {
  {
    icon = "__base__/graphics/icons/roboport.png",
  },
  {
    icon = "__base__/graphics/icons/substation.png",
    scale = 0.5,
    shift = { 60, 60 },
  }
}

--[[ Combined Entities ]] --
local combined_substation                  = mklv_combined_entity("electric-pole", "substation")
combined_substation.fast_replaceable_group = entity.fast_replaceable_group
entity.circuit_connector.points            = combined_substation.connection_points[1]

--[[ Item ]] --
local item = table.deepcopy(data.raw.item["roboport"])

item.name = name
item.order = "c[signal]-a[roboport]am1"
item.place_result = name

item.icons = {
  {
    icon = "__base__/graphics/icons/roboport.png",
    scale = 1.7,
    shift = { 0, 24 },
  },
  {
    icon = "__base__/graphics/icons/substation.png",
    scale = 1.2,
    shift = { 80, -32 },
  },
}

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["roboport"])

recipe.autorecycle = false
recipe.category = "organic"
recipe.name = name
recipe.surface_conditions = { mklv_consts.surface_conditions.pressure.vulcanus }

recipe.ingredients = {
  { type = "item",  name = "roboport",         amount = 1 },
  { type = "item",  name = "substation",       amount = 1 },
  { type = "item",  name = "raw-fish",         amount = 5 },
  { type = "item",  name = "wood",             amount = 5 },
  { type = "fluid", name = "fluoroketone-hot", amount = 25 },
}
recipe.results = { {
  amount = 1,
  name = name,
  type = "item",
} }

--[[ Remnants ]] --
local remnants = table.deepcopy(data.raw["corpse"]["roboport-remnants"])
remnants.name = name .. "-remnants"

--[[ Technology ]] --
local technology = table.deepcopy(data.raw.technology["logistic-robotics"])

technology.name = name

technology.effects = {
  {
    type = "unlock-recipe",
    recipe = name
  },
}
technology.icons = {
  {
    icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
    icon_size = 256,
    scale = 0.4,
    shift = { 64, -24 },
  },
  {
    icon = "__base__/graphics/technology/logistic-robotics.png",
    icon_size = 256,
    scale = 0.425,
    shift = { 0, 48 },
  },
}
technology.prerequisites = {
  "biochamber",
  "cryogenic-plant",
  "electric-energy-distribution-2",
  "logistic-system",
}
technology.unit = {
  count = 15000,
  ingredients = {
    { "automation-science-pack",      1 },
    { "logistic-science-pack",        1 },
    -- { "military-science-pack",        1 },
    { "chemical-science-pack",        1 },
    { "production-science-pack",      1 },
    { "utility-science-pack",         1 },
    -- { "space-science-pack",           1 },
    { "metallurgic-science-pack",     1 },
    { "electromagnetic-science-pack", 1 },
    -- { "agricultural-science-pack",    1 },
    -- { "cryogenic-science-pack",       1 },
    -- { "prometheum-science-pack",       1 },
  },
  time = 30
}

--[[ Export ]] --
data:extend {
  entity,
  combined_substation,
  item,
  recipe,
  remnants,
  technology,
}
