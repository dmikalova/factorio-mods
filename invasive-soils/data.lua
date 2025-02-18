-- TODO: artificial tree soil tint and sort
-- TODO: don't allow overgrowth to be placed on artificial soil
-- TODO: don't allow landfill to be placed on artificial/overgrowth/invasive soil
-- copy overgrowth item and recipe and technology
-- tint icon
-- placeable everywhere but overgrowth and artificial areas
--


local mklv_consts = require("__mklv-lib__.consts")

local name = "invasive-yumako-soil"
local tint = mklv_consts.tints.acid

--[[ Entity ]] --
-- local entity = table.deepcopy(data.raw["overgrowth-yumako-soil"]["overgrowth-yumako-soil"])

-- entity.name = name

-- [[ Tile ]] --
local tile = table.deepcopy(data.raw.tile["overgrowth-yumako-soil"])

tile.name = name
tile.order = "e[yumako]-d[" .. name .. "]i"
tile.minable.result = name
-- tile.representative = name

-- [[ Item ]] --
local item = table.deepcopy(data.raw.item["overgrowth-yumako-soil"])

item.name = name
item.order = "c[landfill]-cc[" .. name .. "]i"
-- item.place_result = name
item.place_as_tile = {
  result = name,
  condition_size = 1,
  -- invert = true,
  condition = { layers = {} },
  tile_condition = {
    "gleba-deep-lake",
    "wetland-blue-slime",
    "wetland-light-dead-skin",
    "wetland-dead-skin",
    "highland-dark-rock",
    "highland-dark-rock-2",
    "pit-rock",
    "highland-yellow-rock",
    "lowland-brown-blubber",
    "lowland-cream-cauliflower",
    "lowland-cream-cauliflower-2",
    "lowland-dead-skin",
    "lowland-dead-skin-2",
    "midland-turquoise-bark",
    "midland-turquoise-bark-2",
    "midland-cracked-lichen",
    "midland-cracked-lichen-dark",
    "midland-cracked-lichen-dull",
    "midland-yellow-crust",
    "midland-yellow-crust-2",
    "midland-yellow-crust-3",
    "midland-yellow-crust-4",
  },
}

--[[ soils
artificial yumako:
  wetland-yumako
overgrowth yumako:
  wetland-yumako
  wetland-light-green-slime
  wetland-green-slime
  lowland-brown-blubber
  lowland-olive-blubber
  lowland-olive-blubber-2
  lowland-olive-blubber-3
  lowland-pale-green

artificial jellynut:
  wetland-jellynut

overgrowth jellynut:
  wetland-jellynut
  wetland-pink-tentacle
  wetland-red-tentacle
  lowland-cream-red
  lowland-red-infection
  lowland-red-vein
  lowland-red-vein-2
  lowland-red-vein-3
  lowland-red-vein-4
  lowland-red-vein-dead

none:
  gleba-deep-lake
  wetland-blue-slime
  wetland-light-dead-skin
  wetland-dead-skin
  highland-dark-rock
  highland-dark-rock-2
  pit-rock
  highland-yellow-rock
  lowland-brown-blubber
  lowland-cream-cauliflower
  lowland-cream-cauliflower-2
  lowland-dead-skin
  lowland-dead-skin-2
  midland-turquoise-bark
  midland-turquoise-bark-2
  midland-cracked-lichen
  midland-cracked-lichen-dark
  midland-cracked-lichen-dull
  midland-yellow-crust
  midland-yellow-crust-2
  midland-yellow-crust-3
  midland-yellow-crust-4

  natural-yumako-soil
  natural-jellynut-soil


]]



item.icons = {
  {
    icon = "__space-age__/graphics/icons/overgrowth-yumako-soil.png",
    tint = tint
  },
}

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["overgrowth-yumako-soil"])

-- recipe.auto_recycle = false
-- recipe.category = "organic"
recipe.name = name
recipe.surface_conditions = { mklv_consts.surface_conditions.pressure.fulgora }

recipe.ingredients = {
  { type = "item",  name = "overgrowth-yumako-soil", amount = 100 },
  { type = "item",  name = "demolisher-egg",         amount = 1 },
  { type = "fluid", name = "electrolyte",            amount = 250 },
}
recipe.results = { {
  amount = 100,
  name = name,
  type = "item",
} }

--[[ Technology ]] --
local technology = table.deepcopy(data.raw.technology["overgrowth-soil"])

technology.name = "invasive-soil"

technology.effects = {
  {
    type = "unlock-recipe",
    recipe = name
  },
}
technology.icons = {
  {
    icon = "__space-age__/graphics/technology/overgrowth-soil.png",
    icon_size = 256,
    tint = tint,
  },
}
technology.prerequisites = {
  "demolisher-egg-handling",
  "electromagnetic-plant",
  "overgrowth-soil",
}
technology.unit = {
  count = 5000,
  ingredients = {
    { "automation-science-pack",      1 },
    { "logistic-science-pack",        1 },
    { "military-science-pack",        1 },
    { "chemical-science-pack",        1 },
    { "production-science-pack",      1 },
    { "utility-science-pack",         1 },
    { "space-science-pack",           1 },
    { "metallurgic-science-pack",     1 },
    { "electromagnetic-science-pack", 1 },
    { "agricultural-science-pack",    1 },
    -- { "cryogenic-science-pack",       1 },
    -- { "prometheum-science-pack",       1 },
  },
  time = 30
}

--[[ Export ]] --
data:extend {
  -- entity,
  tile,
  item,
  recipe,
  technology,
}
