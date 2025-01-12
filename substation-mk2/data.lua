local mklv_consts = require("__mklv-lib__.consts")

local name = "mklv-substation-mk2"
local tint = mklv_consts.tints.acid

--[[ Overview

Adds a Substation MK2 that can be chunk aligned in a 32x32 grid at legendary quality:
- Increases the wire distance and supply area at legendary from 28x28 to 32x32
- Assembled in EM plant on Nauvis

]]             --

--[[ Entity ]] --
local entity = table.deepcopy(data.raw["electric-pole"]["substation"])

entity.name = name
entity.minable.result = name
entity.maximum_wire_distance = 22
entity.supply_area_distance = 11
entity.icons = { {
  icon = "__base__/graphics/icons/substation.png",
  tint = tint,
} }
entity.pictures.layers[1].tint = tint
entity.pictures.layers[2].tint = tint

--[[ Item ]] --
local item = table.deepcopy(data.raw.item["substation"])

item.icons = { {
  icon = "__base__/graphics/icons/substation.png",
  tint = tint
} }
item.name = name
item.order = "a[energy]-m[substation]"
item.place_result = name

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["substation"])

recipe.name = name
recipe.category = "electromagnetics"
recipe.ingredients = {
  { type = "item", name = "substation",          amount = 1 },
  { type = "item", name = "efficiency-module-3", amount = 5 },
  { type = "item", name = "superconductor",      amount = 5 },
}
recipe.results = { {
  amount = 1,
  name = name,
  type = "item",
} }
recipe.surface_conditions = {
  mklv_consts.surface_conditions.pressure.nauvis,
}

--[[ Remnants ]] --
local remnants = table.deepcopy(data.raw["corpse"]["substation-remnants"])
remnants.name = name .. "-remnants"
remnants.animation[1].tint = tint

--[[ Technology ]] --
local technology = table.deepcopy(data.raw.technology["electric-energy-distribution-2"])

technology.effects = { {
  type = "unlock-recipe",
  recipe = name
} }
technology.icons = { {
  icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
  icon_size = 256,
  tint = tint,
} }
technology.name = name
technology.prerequisites = {
  "efficiency-module-3",
  "electric-energy-distribution-2",
  "electromagnetic-plant",
}
technology.unit = {
  count = 10000,
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
    -- { "agricultural-science-pack",    1 },
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
data.raw["electric-pole"]["substation"].next_upgrade = name
