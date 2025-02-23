local mklv_consts = require("__mklv-lib__.consts")

local name = "mklv-radar-mk2"
local tint = mklv_consts.tints.acid

--[[ Entity ]] --
local entity = table.deepcopy(data.raw["radar"]["radar"])

entity.connects_to_other_radars = false
entity.corpse = name .. "-remnants"
entity.energy_per_sector = "8MJ"
entity.energy_usage = "600kW"
entity.max_distance_of_nearby_sector_revealed = 4 -- chunk that radar is centered on ±4 chunks + 2 for each quality level
entity.max_distance_of_sector_revealed = 27       -- chunk that radar is centered on ±27 chunks + 2 for each quality level
entity.minable.result = name
entity.name = name
entity.pictures.layers[1].tint = tint

entity.icons = { {
  icon = "__base__/graphics/icons/radar.png",
  tint = tint,
} }

--[[ Item ]] --
local item = table.deepcopy(data.raw.item["radar"])

item.default_import_location = "gleba"
item.name = name
item.order = "d[radar]-m[radar]"
item.place_result = name

item.icons = { {
  icon = "__base__/graphics/icons/radar.png",
  tint = tint
} }

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["radar"])

recipe.auto_recycle = false
recipe.category = "metallurgy"
recipe.name = name
recipe.surface_conditions = { mklv_consts.surface_conditions.pressure.gleba }

recipe.ingredients = {
  { type = "item", name = "radar",          amount = 1 },
  { type = "item", name = "tungsten-plate", amount = 5 },
}
recipe.results = { {
  amount = 1,
  name = name,
  type = "item",
} }

--[[ Remnants ]] --
local remnants = table.deepcopy(data.raw["corpse"]["radar-remnants"])

remnants.name = name .. "-remnants"
remnants.animation[1].tint = tint

--[[ Technology ]] --
local technology = table.deepcopy(data.raw.technology["radar"])

technology.effects = { {
  type = "unlock-recipe",
  recipe = name
} }
technology.icons = { {
  icon = "__base__/graphics/technology/radar.png",
  icon_size = 256,
  tint = tint,
} }
technology.name = name
technology.prerequisites = {
  "radar",
  "tungsten-steel",
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
