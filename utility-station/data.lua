-- -- executes pineapple only when the pizza mod is active
-- if mods["pizza"] then
--   pineapple()
-- end

-- print("Hello, world!")
-- for k, v in pairs(original) do
-- end
-- print(game.entity_protoypes["radar"])



local mklv_consts = require("__mklv-lib__.consts")
local mklv_attribute_transfer = require("__mklv-lib__/attribute-transfer")
local name = "mklv-utility-station"

--[[ Overview

Adds a Utility Station that combines the functions of a Roboport and Substation, and optionally Lightning Collector or Radar:

- Assembled in a biochamber on vulcanis

]]             --

--[[ Entity ]] --
local entity = table.deepcopy(data.raw["roboport"]["roboport"])

entity.door_animation_down.tint = mklv_consts.tints.mk1
entity.door_animation_up.tint = mklv_consts.tints.mk1
entity.base_animation.tint = mklv_consts.tints.mk1
entity.base_patch.tint = mklv_consts.tints.mk1
entity.base.layers[1].tint = mklv_consts.tints.mk1
entity.corpse = name .. "-remnants"
entity.icons = { {
  icon = "__base__/graphics/icons/roboport.png",
  tint = mklv_consts.tints.mk1
} }
entity.name = name

--[[ Item ]] --
local item = table.deepcopy(data.raw.item["roboport"])

item.icons = { {
  icon = "__base__/graphics/icons/roboport.png",
  tint = mklv_consts.tints.mk1
} }
item.name = name
item.order = "c[signal]-m[roboport]"
item.place_result = name

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["roboport"])

recipe.name = name
recipe.category_id = "biochamber"
recipe.ingredients = {
  { type = "item", name = "roboport",   amount = 1 },
  { type = "item", name = "substation", amount = 1 },
  { type = "item", name = "raw-fish",   amount = 5 },
  { type = "item", name = "wood",       amount = 5 },
}
recipe.results = { {
  amount = 1,
  name = name,
  type = "item",
} }
recipe.surface_conditions = {
  mklv_consts.surface_conditions.pressure.vulcanis,
}

--[[ Remnants ]] --
local remnants = table.deepcopy(data.raw["corpse"]["roboport-remnants"])
remnants.name = name .. "-remnants"
remnants.animation[1].tint = mklv_consts.tints.mk1
remnants.animation[2].tint = mklv_consts.tints.mk1

--[[ Technology ]] --
local technology = table.deepcopy(data.raw.technology["logistic-robotics"])

technology.effects = {
  {
    type = "unlock-recipe",
    recipe = name
  },
  -- {
  --   type = "unlock-recipe",
  --   recipe = name .. "-l"
  -- },
  -- {
  --   type = "unlock-recipe",
  --   recipe = name .. "-r"
  -- },
  -- {
  --   type = "unlock-recipe",
  --   recipe = name .. "-lr"
  -- },
}
technology.icons = { {
  icon = "__base__/graphics/technology/logistic-robotics.png",
  icon_size = 256,
  tint = mklv_consts.tints.mk1,
} }
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
    { "space-science-pack",           1 },
    { "metallurgic-science-pack",     1 },
    { "electromagnetic-science-pack", 1 },
    { "agricultural-science-pack",    1 },
    { "cryogenic-science-pack",       1 },
    -- { "prometheum-science-pack",       1 },
  },
  time = 30
}

local entity = mklv_attribute_transfer(entity, "substation")
-- Should only be placeable on fulgora
-- local entity_l = mklv_attribute_transfer(entity, "lightning-collector")
-- local entity_lr = mklv_attribute_transfer(entity_l, "radar")
-- local entity_r = mklv_attribute_transfer(entity, "radar")

--[[ Export ]] --
data:extend {
  -- entity_l,
  -- entity_lr,
  -- entity_r,
  entity,
  -- item_l,
  -- item_lr,
  -- item_r,
  item,
  -- recipe_l,
  -- recipe_lr,
  -- recipe_r,
  recipe,
  remnants,
  technology,
}
