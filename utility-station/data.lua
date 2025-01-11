-- -- executes pineapple only when the pizza mod is active
-- if mods["pizza"] then
--   pineapple()
-- end

-- print("Hello, world!")
-- for k, v in pairs(original) do
-- end
-- print(game.entity_protoypes["radar"])



local mklv_consts = require("__mklv-lib__.consts")
local mklv_combined_entity = require("__mklv-lib__/combined-entity")

local name = "mklv-utility-station"
-- local tint = mklv_consts.tints.pink

--[[ Overview

Adds a Utility Station that combines the functions of a Roboport and Substation, and optionally Lightning Collector or Radar:

- Assembled in an electromagnetic plant on Nauvis

]]             --

--[[ Entity ]] --
local entity          = table.deepcopy(data.raw["roboport"]["roboport"])

entity.minable.result = name
-- -- entity.door_animation_down.tint = tint
-- -- entity.door_animation_up.tint   = tint
-- -- entity.base_animation.tint      = tint
-- -- entity.base_patch.tint          = tint
-- -- entity.base.layers[1].tint      = tint
entity.corpse         = name .. "-remnants"
entity.icons          = {
  {
    icon = "__base__/graphics/icons/roboport.png",
    -- -- tint = tint
  },
  {
    icon = "__base__/graphics/icons/substation.png",
    scale = 0.5,
    shift = { 60, 60 },
    -- -- tint = tint,
  }
}
entity.name           = name

-- if mods["mklv-utility-station-mk2"] then
--   entity.next_upgrade = "mklv-utility-station-mk2"
-- end

--[[ combined entities]] --
local combined_substation                  = mklv_combined_entity("electric-pole", "substation")
-- combined_substation.connection_points       = { {
--   shadow = { copper = { 3.15, -0.6 } },
--   wire = { copper = { 1.35, -1.75 } }
-- } }
combined_substation.fast_replaceable_group = entity.fast_replaceable_group
-- -- combined_substation.pictures.layers[1].tint = tint

--[[ Item ]] --
local item = table.deepcopy(data.raw.item["roboport"])

item.icons = {
  {
    icon = "__base__/graphics/icons/roboport.png",
    scale = 1.7,
    shift = { 0, 24 },
    -- -- tint = tint
  },
  {
    icon = "__base__/graphics/icons/substation.png",
    scale = 1.2,
    shift = { 80, -32 },
    -- -- tint = tint,
  },
}
item.name = name
item.order = "c[signal]-a[roboport]am1"
item.place_result = name
-- TODO wire reach should match substation charging

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["roboport"])

recipe.name = name
recipe.category_id = "electromagnetic"
recipe.ingredients = {
  { type = "item", name = "wood",       amount = 5 },
  { type = "item", name = "raw-fish",   amount = 5 },
  { type = "item", name = "substation", amount = 1 },
  { type = "item", name = "roboport",   amount = 1 },
}
recipe.results = { {
  amount = 1,
  name = name,
  type = "item",
} }
recipe.surface_conditions = { mklv_consts.surface_conditions.pressure.nauvis }

--[[ Remnants ]] --
local remnants = table.deepcopy(data.raw["corpse"]["roboport-remnants"])
remnants.name = name .. "-remnants"
-- -- remnants.animation[1].tint = tint
-- -- remnants.animation[2].tint = tint

--[[ Technology ]] --
local technology = table.deepcopy(data.raw.technology["logistic-robotics"])

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
technology.name = name
technology.prerequisites = {
  "logistic-system",
  "electric-energy-distribution-2",
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
