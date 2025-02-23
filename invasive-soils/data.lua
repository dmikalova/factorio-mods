local mklv_consts = require("__mklv-lib__.consts")
local tint = mklv_consts.tints.black

require("prototypes.invasive-jellynut-soil")
require("prototypes.invasive-yumako-soil")

--[[ Technology ]] --
local technology = table.deepcopy(data.raw.technology["overgrowth-soil"])

technology.name = "invasive-soils"

technology.effects = {
  {
    type = "unlock-recipe",
    recipe = "invasive-jellynut-soil"
  },
  {
    type = "unlock-recipe",
    recipe = "invasive-yumako-soil"
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
  technology,
}
