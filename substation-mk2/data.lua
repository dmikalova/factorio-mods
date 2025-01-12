local mklv_consts = require("__mklv-lib__.consts")

local name = "mklv-substation-mk2"
local tint = mklv_consts.tints.acid

--[[ Entity ]] --
local entity = table.deepcopy(data.raw["electric-pole"]["substation"])

entity.maximum_wire_distance = 22
entity.minable.result = name
entity.name = name
entity.pictures.layers[1].tint = tint
entity.pictures.layers[2].tint = tint
entity.supply_area_distance = 11

entity.icons = { {
  icon = "__base__/graphics/icons/substation.png",
  tint = tint,
} }

--[[ Item ]] --
local item = table.deepcopy(data.raw.item["substation"])

item.name = name
item.order = "a[energy]-m[substation]"
item.place_result = name

item.icons = { {
  icon = "__base__/graphics/icons/substation.png",
  tint = tint
} }

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["substation"])

recipe.category = "electromagnetics"
recipe.name = name
recipe.surface_conditions = { mklv_consts.surface_conditions.pressure.aquilo }

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

--[[ Remnants ]] --
local remnants = table.deepcopy(data.raw["corpse"]["substation-remnants"])
remnants.animation[1].tint = tint
remnants.name = name .. "-remnants"

--[[ Technology ]] --
local technology = table.deepcopy(data.raw.technology["electric-energy-distribution-2"])

technology.name = name

technology.effects = { {
  type = "unlock-recipe",
  recipe = name
} }
technology.icons = { {
  icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
  icon_size = 256,
  tint = tint,
} }
technology.prerequisites = {
  "efficiency-module-3",
  "electric-energy-distribution-2",
  "electromagnetic-plant",
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
