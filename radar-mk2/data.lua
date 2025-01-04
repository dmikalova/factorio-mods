local mklv_consts = require("__mklv-lib__.consts")
local name = "mklv-radar-mk2"

--[[ Overview

Adds a radar MK2 that can be better chunk aligned:
- Increases the nearby sector scan from 7x7 to 9x9 chunks (must be odd)
- Increases the sector scanning from 29x29 to 33x33 chunks (must be odd)
- Energy usage doubled from 300kW to 600kW resulting in faster scans
- Sector scan energy decreased from 10MW to 8MW
- Assembled in Foundry on Gleba

]]             --

--[[ Entity ]] --
local entity = table.deepcopy(data.raw["radar"]["radar"])

entity.name = name
entity.energy_usage = "600kW"
entity.energy_per_sector = "8MJ"
entity.icons = { {
  icon = "__base__/graphics/icons/radar.png",
  tint = mklv_consts.tints.mk2,
} }
entity.pictures.layers[1].tint = mklv_consts.tints.mk2
-- TODO: account for quality increasing  range
entity.max_distance_of_sector_revealed = 16
entity.max_distance_of_nearby_sector_revealed = 8
entity.connects_to_other_radars = false

--[[ Item ]] --
local item = table.deepcopy(data.raw.item["radar"])

item.icons = { {
  icon = "__base__/graphics/icons/radar.png",
  tint = mklv_consts.tints.mk2
} }
item.name = name
item.order = "z-d[radar]-m[radar]"
item.place_result = name

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["radar"])

recipe.name = name
recipe.category_id = "metallurgy"
recipe.ingredients = {
  { type = "item", name = "radar",    amount = 1 },
  { type = "item", name = "tungsten-plate", amount = 5 },
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
local remnants = table.deepcopy(data.raw["corpse"]["radar-remnants"])
remnants.name = name .. "-remnants"
remnants.animation[1].tint = mklv_consts.tints.mk2

--[[ Technology ]] --
local technology = table.deepcopy(data.raw.technology["radar"])

technology.effects = { {
  type = "unlock-recipe",
  recipe = name
} }
technology.icons = { {
  icon = "__base__/graphics/technology/radar.png",
  icon_size = 256,
  tint = mklv_consts.tints.mk2,
} }
technology.name = name
technology.prerequisites = {
  "radar",
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
    -- { "cryogenic-science-pack",       1 },
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
data.raw["radar"]["radar"].next_upgrade = name
