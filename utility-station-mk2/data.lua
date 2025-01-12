local mklv_consts          = require("__mklv-lib__.consts")
local mklv_combined_entity = require("__mklv-lib__/combined-entity")

local name                 = "mklv-utility-station-mk2"
local name_l               = name .. "-l"
local name_r               = name .. "-r"
local name_rl              = name .. "-rl"
local tint                 = mklv_consts.tints.acid
local tint_l               = mklv_consts.tints.yellow
local tint_r               = mklv_consts.tints.pink
local tint_rl              = mklv_consts.tints.purple

--[[ Overview

Adds Utility Station MK2 that combines the functions of Roboports and Substations; and optionally Lightning Collector or Radar:

- Assembled in a biochamber on vulcanis
- -l, -r, and -rl variants with Lightning Collector, Radar, and both
-- TODO writeup details

]]             --

--[[ Entity ]] --
local entity                     = table.deepcopy(data.raw["roboport"]
  ["mklv-utility-station"])

entity.circuit_wire_max_distance = 30
entity.collision_box             = { { -0.85, -0.85 }, { 0.85, 0.85 } }
entity.minable.result            = name
entity.selection_box             = { { -1, -1 }, { 1, 1 } }
entity.name                      = name
entity.next_upgrade              = nil
entity.corpse                    = name .. "-remnants"


entity.base_animation.scale                                 = 0.25
entity.base_animation.shift                                 = { -0.32, -1 }
entity.base_animation.tint                                  = tint
entity.base_patch.scale                                     = 0.25
entity.base_patch.shift                                     = { 0, 0.125 }
entity.base_patch.tint                                      = tint
entity.base.layers[1].scale                                 = 0.25
entity.base.layers[1].shift                                 = { 0, 0.125 }
entity.base.layers[1].tint                                  = tint
entity.base.layers[2].scale                                 = 0.25
entity.base.layers[2].shift                                 = { 1, 0.125 }
entity.door_animation_down.scale                            = 0.25
entity.door_animation_down.shift                            = { -0.007813 * 0.125 - 0.025, -0.617188 * 0.125 - 0.04 }
entity.door_animation_down.tint                             = tint
entity.door_animation_up.scale                              = 0.25
entity.door_animation_up.shift                              = { -0.007813 * 0.125 - 0.025, -1.234375 * 0.25 - 0.12 }
entity.door_animation_up.tint                               = tint

entity.circuit_connector.sprites.blue_led_light_offset      = { 0.578125 - 0.125, 1.25 - 0.4 }
entity.circuit_connector.sprites.connector_main.shift       = { 0.578125 - 0.125, 1 - 0.4 }
entity.circuit_connector.sprites.led_blue_off.shift         = { 0.578125 - 0.125, 0.96875 - 0.4 }
entity.circuit_connector.sprites.led_blue.shift             = { 0.578125 - 0.125, 0.96875 - 0.4 }
entity.circuit_connector.sprites.led_green.shift            = { 0.578125 - 0.125, 0.96875 - 0.4 }
entity.circuit_connector.sprites.led_red.shift              = { 0.578125 - 0.125, 0.96875 - 0.4 }
entity.circuit_connector.sprites.red_green_led_light_offset = { 0.578125 - 0.125, 1.15625 - 0.4 }
entity.circuit_connector.sprites.wire_pins.shift            = { 0.578125 - 0.125, 1 - 0.4 }

entity.icons                                                = { {
  icon = "__base__/graphics/icons/roboport.png",
  tint = tint
} }

local connection_points_scale                               = 0.5
entity.circuit_connector.points                             = {
  shadow = {
    -- copper = { 4.25, 0.25 },
    copper = { 4.25, 0.25 * connection_points_scale - 0.5 },
    green = { 3.875 * 0.5, 0.25 * connection_points_scale - 0.5 },
    red = { 4.71875 * 0.5, 0.28125 * connection_points_scale - 0.5 }
  },
  wire = {
    -- copper = { 0, -2.6875 },
    copper = { 0, -2.6875 * connection_points_scale - 0.5 },
    green = { -0.65625 * 0.5, -2.5625 * connection_points_scale - 0.5 },
    red = { 0.6875 * 0.5, -2.53125 * connection_points_scale - 0.5 }
  }
}

--[[ Variant entities]] --
local entity_l                                = table.deepcopy(entity)
entity_l.name                                 = name_l
entity_l.minable.result                       = name_l
entity_l.surface_conditions                   = { mklv_consts.surface_conditions
    .magnetic_field
    .fulgora }

local entity_r                                = table.deepcopy(entity)
entity_r.name                                 = name_r
entity_r.minable.result                       = name_r

local entity_rl                               = table.deepcopy(entity_r)
entity_rl.name                                = name_rl
entity_rl.minable.result                      = name_rl
entity_rl.surface_conditions                  = { mklv_consts.surface_conditions
    .magnetic_field
    .fulgora }

local combined_substation                     = mklv_combined_entity("electric-pole",
  "mklv-substation-mk2")
combined_substation.fast_replaceable_group    = entity.fast_replaceable_group
combined_substation.pictures.layers[1].tint   = tint
combined_substation.pictures.layers[1].scale  = 0.25

combined_substation.connection_points         = {
  {
    shadow = {
      -- copper = { 4.25, 0.25 },
      copper = { 4.25, 0.25 * connection_points_scale - 0.5 },
      green = { 3.875, 0.25 },
      red = { 4.71875, 0.28125 }
    },
    wire = {
      -- copper = { 0, -2.6875 },
      copper = { 0, -2.6875 * connection_points_scale - 0.5 },
      green = { -0.65625, -2.5625 },
      red = { 0.6875, -2.53125 }
    }
  },
  {
    shadow = {
      -- copper = { 4.15625, 0.28125 },
      copper = { 4.15625, 0.28125 * connection_points_scale - 0.5 },
      green = { 4.5, 0.65625 },
      red = { 3.4375, -0.09375 }
    },
    wire = {
      -- copper = { 0, -2.65625 },
      copper = { 0, -2.65625 * connection_points_scale - 0.5 },
      green = { 0.46875, -2.1875 },
      red = { -0.46875, -2.875 }
    }
  },
  {
    shadow = {
      -- copper = { 4.15625, 0.28125 },
      copper = { 4.15625, 0.28125 * connection_points_scale - 0.5 },
      green = { 3.96875, 0.8125 },
      red = { 3.96875, -0.25 }
    },
    wire = {
      -- copper = { 0, -2.65625 },
      copper = { 0, -2.65625 * connection_points_scale - 0.5 },
      green = { 0, -2.0625 },
      red = { 0, -3.03125 }
    }
  },
  {
    shadow = {
      -- copper = { 4.15625, 0.28125 },
      copper = { 4.15625, 0.28125 * connection_points_scale - 0.5 },
      green = { 3.46875, 0.625 },
      red = { 4.5, -0.09375 }
    },
    wire = {
      -- copper = { 0, -2.6875 },
      copper = { 0, -2.6875 * connection_points_scale - 0.5 },
      green = { -0.46875, -2.21875 },
      red = { 0.46875, -2.875 }
    }
  }
}

local combined_radar                          = mklv_combined_entity("radar", "mklv-radar-mk2")
combined_radar.fast_replaceable_group         = entity.fast_replaceable_group
combined_radar.integration_patch              = nil
combined_radar.integration_patch_render_layer = nil

combined_radar.pictures                       = {
  filename = "__mklv-lib__/graphics/hidden-entity.png",
  width = 1,
  height = 1,
  direction_count = 1
}


local combined_lightning_collector                                      = mklv_combined_entity("lightning-attractor",
  "lightning-collector")
combined_lightning_collector.chargable_graphics.picture.layers[1].scale = 0.25
combined_lightning_collector.chargable_graphics.picture.layers[1].shift = { 0, -0.6 }
combined_lightning_collector.chargable_graphics.picture.layers[1].tint  = tint
combined_lightning_collector.chargable_graphics.picture.layers[2].scale = 0.25
combined_lightning_collector.chargable_graphics.picture.layers[2].shift = { 0, -0.6 }
combined_lightning_collector.fast_replaceable_group                     = entity.fast_replaceable_group

--[[ Item ]] --
local item = table.deepcopy(data.raw.item["mklv-utility-station"])

local icon_roboport_scale = 0.425
local icon_others_scale = 0.3

item.icons = {
  {
    icon = "__base__/graphics/icons/roboport.png",
    icon_size = 64,
    scale = icon_roboport_scale,
    shift = { 0, 12 },
    tint = tint
  },
  {
    icon = "__base__/graphics/icons/substation.png",
    icon_size = 64,
    scale = icon_others_scale,
    shift = { 28, -12 },
    tint = tint,
  },
}
item.name = name
item.order = "c[signal]-a[roboport]amu2"
item.place_result = name

--[[ Combined items ]] --
local item_l = table.deepcopy(item)
item_l.icons[1].tint = tint_l
item_l.icons[2].tint = tint_l
table.insert(item_l.icons, {
  icon = "__space-age__/graphics/icons/lightning-collector.png",
  icon_size = 64,
  scale = icon_others_scale,
  shift = { 18, -12 },
  tint = tint_l
})
item_l.name = name_l
item_l.place_result = name_l

local item_r = table.deepcopy(item)
item_r.icons[1].tint = tint_r
item_r.icons[2].tint = tint_r
table.insert(item_r.icons, {
  icon = "__base__/graphics/icons/radar.png",
  icon_size = 64,
  scale = icon_others_scale,
  shift = { -4, -12 },
  tint = tint_r
})
item_r.name = name_r
item_r.place_result = name_r

local item_rl = table.deepcopy(item_l)
item_rl.icons[1].tint = tint_rl
item_rl.icons[2].tint = tint_rl
item_rl.icons[3].tint = tint_rl
table.insert(item_rl.icons, {
  icon = "__base__/graphics/icons/radar.png",
  icon_size = 64,
  scale = icon_others_scale,
  shift = { -4, -12 },
  tint = tint_rl
})
item_rl.name = name_rl
item_rl.place_result = name_rl

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["mklv-utility-station"])

recipe.category = "crafting-with-fluid"
recipe.name = name
recipe.category = "centrifuging"
recipe.ingredients = {
  { type = "item",  name = "electric-engine-unit", amount = 10 },
  { type = "item",  name = "uranium-fuel-cell",    amount = 5 },
  { type = "item",  name = "calcite",              amount = 10 },
  { type = "item",  name = "tungsten-carbide",     amount = 5 },
  { type = "item",  name = "holmium-plate",        amount = 10 },
  { type = "item",  name = "supercapacitor",       amount = 5 },
  { type = "item",  name = "bioflux",              amount = 10 },
  { type = "item",  name = "carbon-fiber",         amount = 5 },
  { type = "item",  name = "fusion-power-cell",    amount = 10 },
  { type = "item",  name = "mklv-substation-mk2",  amount = 1 },
  { type = "item",  name = "mklv-roboport-mk2",    amount = 1 },
  { type = "item",  name = "mklv-utility-station", amount = 1 },
  { type = "fluid", name = "fluoroketone-hot",     amount = 5 },
}
recipe.results = { {
  amount = 1,
  name = name,
  type = "item",
} }
recipe.surface_conditions = { mklv_consts.surface_conditions.pressure.space }

--[[ Combined recipes ]] --
local recipe_l = table.deepcopy(recipe)
recipe_l.name = name_l
recipe_l.results = { {
  amount = 1,
  name = name_l,
  type = "item",
} }
table.insert(recipe_l.ingredients, 4, { type = "item", name = "lightning-collector", amount = 1 })

local recipe_r = table.deepcopy(recipe)
recipe_r.name = name_r
recipe_r.results = { {
  amount = 1,
  name = name_r,
  type = "item",
} }
table.insert(recipe_r.ingredients, 4, { type = "item", name = "mklv-radar-mk2", amount = 1 })

local recipe_rl = table.deepcopy(recipe_l)
recipe_rl.name = name_rl
recipe_rl.results = { {
  amount = 1,
  name = name_rl,
  type = "item",
} }
table.insert(recipe_rl.ingredients, 4, { type = "item", name = "mklv-radar-mk2", amount = 1 })

--[[ Remnants ]] --
local remnants = table.deepcopy(data.raw["corpse"]["roboport-remnants"])
remnants.name = name .. "-remnants"
remnants.animation[1].tint = tint
remnants.animation[2].tint = tint

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
technology.icons = {
  {
    icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
    icon_size = 256,
    scale = icon_others_scale,
    shift = { 80, -24 },
    tint = tint,
  },
  {
    icon = "__space-age__/graphics/technology/lightning-collector.png",
    icon_size = 256,
    scale = icon_others_scale,
    shift = { 36, -24 },
    tint = tint,
  },
  {
    icon = "__base__/graphics/technology/radar.png",
    icon_size = 256,
    scale = icon_others_scale,
    shift = { -16, -24 },
    tint = tint,
  },
  {
    icon = "__base__/graphics/technology/logistic-robotics.png",
    icon_size = 256,
    scale = icon_roboport_scale,
    shift = { 0, 48 },
    tint = tint,
  },
}
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
  combined_lightning_collector,
  combined_radar,
  combined_substation,
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
