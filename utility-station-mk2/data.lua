-- -- executes pineapple only when the pizza mod is active
-- if mods["pizza"] then
--   pineapple()
-- end

-- print("Hello, world!")
-- for k, v in pairs(original) do
-- end
-- print(game.entity_protoypes["radar"])



local mklv_consts = require("__mklv-lib__.consts")
local mklv_hidden_entity = require("__mklv-lib__/hidden-entity")
local name = "mklv-utility-station-mk2"
local name_l = name .. "-l"
local name_r = name .. "-r"
local name_rl = name .. "-rl"

--[[ Overview

Adds Utility Station MK2 that combines the functions of Roboports and Substations; and optionally Lightning Collector or Radar:

- Assembled in a biochamber on vulcanis
- -l, -r, and -rl variants with Lightning Collector, Radar, and both

]]             --

--[[ Entity ]] --
local entity = table.deepcopy(data.raw["roboport"]["mklv-utility-station"])

entity.door_animation_down.tint = mklv_consts.tints.mk2
entity.door_animation_up.tint = mklv_consts.tints.mk2
entity.base_animation.tint = mklv_consts.tints.mk2
entity.base_patch.tint = mklv_consts.tints.mk2
entity.base.layers[1].tint = mklv_consts.tints.mk2
entity.corpse = name .. "-remnants"
entity.icons = { {
  icon = "__base__/graphics/icons/roboport.png",
  tint = mklv_consts.tints.mk2
} }
entity.name = name

--[[ Variant entities]] --
local entity_l = table.deepcopy(entity)
entity_l.name = name_l
local entity_r = table.deepcopy(entity)
entity_r.name = name_r
local entity_rl = table.deepcopy(entity_r)
entity_rl.name = name_rl


local hidden_substation             = mklv_hidden_entity("electric-pole", "mklv-substation-mk2")
hidden_substation.connection_points = { {
  shadow = { copper = { 3.15, -0.6 } },
  wire = { copper = { 1.35, -1.75 } }
} }
-- TODO: isn't there an replacement group?
-- hidden_substation.next_upgrade      = "mklv-utility-station-mk2"

local hidden_radar                  = mklv_hidden_entity("radar", "mklv-radar-mk2")
-- hidden_radar.next_upgrade           = "mklv-utility-station-mk2"

local hidden_lightning_collector    = mklv_hidden_entity("lightning-attractor", "lightning-collector")
-- hidden_radar.next_upgrade           = "mklv-utility-station-mk2"

--[[ Item ]] --
local item = table.deepcopy(data.raw.item["mklv-utility-station"])

item.icons = { {
  icon = "__base__/graphics/icons/roboport.png",
  tint = mklv_consts.tints.mk2
} }
item.name = name
item.order = "c[signal]-m[roboport]"
item.place_result = name

--[[ Combined items ]] --
local item_l = table.deepcopy(item)
item_l.icons = { {
  icon = "__base__/graphics/icons/roboport.png",
  tint = mklv_consts.tints.mk2
} }
item_l.name = name_l
item_l.place_result = name_l

local item_r = table.deepcopy(item)
item_r.icons = { {
  icon = "__base__/graphics/icons/roboport.png",
  tint = mklv_consts.tints.mk2
} }
item_r.name = name_r
item_r.place_result = name_r

local item_rl = table.deepcopy(item)
item_rl.icons = { {
  icon = "__base__/graphics/icons/roboport.png",
  tint = mklv_consts.tints.mk2
} }
item_rl.name = name_rl
item_rl.place_result = name_rl

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["mklv-utility-station"])

recipe.name = name
recipe.category_id = "biochamber"
recipe.ingredients = {
  -- TODO: proper recipe
  { type = "item", name = "mklv-roboport-mk2",   amount = 1 },
  { type = "item", name = "mklv-substation-mk2", amount = 1 },
  { type = "item", name = "raw-fish",            amount = 5 },
  { type = "item", name = "wood",                amount = 5 },
}
recipe.results = { {
  amount = 1,
  name = name,
  type = "item",
} }
recipe.surface_conditions = {
  mklv_consts.surface_conditions.pressure.vulcanis,
}

--[[ Combined recipes ]] --
-- TODO: update recipe results and create items
local recipe_l = table.deepcopy(recipe)
recipe_l.name = name_l
recipe_l.results[1].name = name_l
table.insert(recipe_l.ingredients, { type = "item", name = "lightning-collector", amount = 1 })

local recipe_r = table.deepcopy(recipe)
recipe_r.name = name_r
table.insert(recipe_r.ingredients, { type = "item", name = "mklv-radar-mk2", amount = 1 })

local recipe_rl = table.deepcopy(recipe_l)
recipe_rl.name = name_rl
table.insert(recipe_rl.ingredients, { type = "item", name = "mklv-radar-mk2", amount = 1 })

-- TODO: Lightning variant should only be placeable on fulgora
-- TODO: roboport icon should overlay substation etc


--[[ Remnants ]] --
local remnants = table.deepcopy(data.raw["corpse"]["roboport-remnants"])
remnants.name = name .. "-remnants"
remnants.animation[1].tint = mklv_consts.tints.mk2
remnants.animation[2].tint = mklv_consts.tints.mk2

--[[ Technology ]] --
local technology = table.deepcopy(data.raw.technology["logistic-robotics"])

technology.effects = {
  {
    type = "unlock-recipe",
    recipe = name
  },
  {
    type = "unlock-recipe",
    recipe = name_l
  },
  {
    type = "unlock-recipe",
    recipe = name_r
  },
  {
    type = "unlock-recipe",
    recipe = name_rl
  },
}
technology.icons = { {
  icon = "__base__/graphics/technology/logistic-robotics.png",
  icon_size = 256,
  tint = mklv_consts.tints.mk2,
  -- TODO: overlay with substation lightning collector and radar
} }
technology.name = name
technology.prerequisites = {
  "electric-energy-distribution-2",
  "logistic-system",
  "mklv-utility-station",
}
technology.unit = {
  count = 100000,
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
  entity_l,
  entity_r,
  entity_rl,
  entity,
  hidden_lightning_collector,
  hidden_radar,
  hidden_substation,
  item_l,
  item_r,
  item_rl,
  item,
  recipe_l,
  recipe_r,
  recipe_rl,
  recipe,
  remnants,
  technology,
}
