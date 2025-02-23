local mklv_consts = require("__mklv-lib__.consts")

local name = "invasive-jellynut-soil"
local tint = mklv_consts.tints.orange

-- [[ Tile ]] --
local tile = table.deepcopy(data.raw.tile["overgrowth-jellynut-soil"])

tile.name = name
tile.order = "c[jellynut]-d[" .. name .. "]i"
tile.minable.result = name

-- [[ Item ]] --
local item = table.deepcopy(data.raw.item["overgrowth-jellynut-soil"])

item.name = name
item.order = "c[landfill]-ee[" .. name .. "]i"
item.place_as_tile = {
  result = name,
  condition_size = 1,
  condition = { layers = {} },
  tile_condition = {
    -- jellynut tiles
    "wetland-jellynut",
    "lowland-cream-red",
    "lowland-red-infection",
    "lowland-red-vein-2",
    "lowland-red-vein-3",
    "lowland-red-vein-4",
    "lowland-red-vein-dead",
    "lowland-red-vein",
    "wetland-pink-tentacle",
    "wetland-red-tentacle",

    -- non-jellynut/yumako tiles
    "gleba-deep-lake",
    "highland-dark-rock-2",
    "highland-dark-rock",
    "highland-yellow-rock",
    "lowland-brown-blubber",
    "lowland-cream-cauliflower-2",
    "lowland-cream-cauliflower",
    "lowland-dead-skin-2",
    "lowland-dead-skin",
    "midland-cracked-lichen-dark",
    "midland-cracked-lichen-dull",
    "midland-cracked-lichen",
    "midland-turquoise-bark-2",
    "midland-turquoise-bark",
    "midland-yellow-crust-2",
    "midland-yellow-crust-3",
    "midland-yellow-crust-4",
    "midland-yellow-crust",
    "pit-rock",
    "wetland-blue-slime",
    "wetland-dead-skin",
    "wetland-light-dead-skin",
  },
}

item.icons = {
  {
    icon = "__space-age__/graphics/icons/overgrowth-jellynut-soil.png",
    tint = tint
  },
}

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["overgrowth-jellynut-soil"])

recipe.icon = nil
recipe.name = name
recipe.surface_conditions = { mklv_consts.surface_conditions.pressure.aquilo }

recipe.crafting_machine_tint = {
  primary = { r = 1, g = 0, b = 0.25, a = 1 },
  secondary = { r = 1, g = 0, b = 0.25, a = 1 },
}

recipe.ingredients = {
  { type = "item",  name = "overgrowth-jellynut-soil", amount = 100 },
  { type = "item",  name = "demolisher-egg",           amount = 1 },
  { type = "fluid", name = "fluoroketone-cold",        amount = 250 },
}

recipe.results = { {
  amount = 100,
  name = name,
  type = "item",
} }

--[[ Export ]] --
data:extend {
  -- entity,
  tile,
  item,
  recipe,
}
