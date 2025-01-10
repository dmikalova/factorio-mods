local mklv_consts                                           = require("__mklv-lib__.consts")
local mklv_hidden_entity                                    = require("__mklv-lib__/hidden-entity")

local name                                                  = "mklv-utility-station-mk2"
local name_l                                                = name .. "-l"
local name_r                                                = name .. "-r"
local name_rl                                               = name .. "-rl"
local tint                                                  = mklv_consts.tints.green
local tint_l                                                = mklv_consts.tints.yellow
local tint_r                                                = mklv_consts.tints.purple
local tint_rl                                               = mklv_consts.tints.white

--[[ Overview

Adds Utility Station MK2 that combines the functions of Roboports and Substations; and optionally Lightning Collector or Radar:

- Assembled in a biochamber on vulcanis
- -l, -r, and -rl variants with Lightning Collector, Radar, and both

]] --

-- Copy quality level to hidden entity
-- TODO: extend roboport mk2 circuit connection length?
-- TODO: fix scale of item in chest
-- TODO: different tints for -l, -r, -rl
-- tints https://github.com/justarandomgeek/factorio-color-coding/blob/master/prototypes/config.lua
-- resize https://mods.factorio.com/mod/mini?from=search

; --[[ Entity ]] --
local entity                                                = table.deepcopy(data.raw["roboport"]
  ["mklv-utility-station"])

entity.minable.result                                       = name
entity.collision_box                                        = { { -0.85, -0.85 }, { 0.85, 0.85 } }
entity.selection_box                                        = { { -1, -1 }, { 1, 1 } }
entity.door_animation_down.tint                             = tint
entity.door_animation_down.scale                            = 0.25
entity.door_animation_down.shift                            = { -0.007813 * 0.125 - 0.025, -0.617188 * 0.125 - 0.04 }
entity.door_animation_up.tint                               = tint
entity.door_animation_up.scale                              = 0.25
entity.door_animation_up.shift                              = { -0.007813 * 0.125 - 0.025, -1.234375 * 0.25 - 0.12 }
entity.base_animation.tint                                  = tint
entity.base_animation.scale                                 = 0.25
entity.base_animation.shift                                 = { -0.32, -1 }
entity.base_patch.tint                                      = tint
entity.base_patch.scale                                     = 0.25
entity.base_patch.shift                                     = { 0, 0.125 }
entity.base.layers[1].tint                                  = tint
entity.base.layers[1].scale                                 = 0.25
entity.base.layers[1].shift                                 = { 0, 0.125 }
entity.base.layers[2].scale                                 = 0.25
entity.base.layers[2].shift                                 = { 1, 0.125 }
entity.circuit_wire_max_distance                            = 16

entity.circuit_connector.sprites.blue_led_light_offset      = { 0.578125 - 0.125, 1.25 - 0.4 }
entity.circuit_connector.sprites.connector_main.shift       = { 0.578125 - 0.125, 1 - 0.4 }
entity.circuit_connector.sprites.led_blue.shift             = { 0.578125 - 0.125, 0.96875 - 0.4 }
entity.circuit_connector.sprites.led_blue_off.shift         = { 0.578125 - 0.125, 0.96875 - 0.4 }
entity.circuit_connector.sprites.led_green.shift            = { 0.578125 - 0.125, 0.96875 - 0.4 }
entity.circuit_connector.sprites.led_red.shift              = { 0.578125 - 0.125, 0.96875 - 0.4 }
entity.circuit_connector.sprites.red_green_led_light_offset = { 0.578125 - 0.125, 1.15625 - 0.4 }
entity.circuit_connector.sprites.wire_pins.shift            = { 0.578125 - 0.125, 1 - 0.4 }

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
entity.corpse                                               = name .. "-remnants"
entity.icons                                                = { {
  icon = "__base__/graphics/icons/roboport.png",
  tint = tint
} }
entity.name                                                 = name
entity.next_upgrade                                         = nil

--[[ Variant entities]] --
local entity_l                                                        = table.deepcopy(entity)
entity_l.name                                                         = name_l
entity_l.minable.result                                               = name_l
entity_l.surface_conditions                                           = { mklv_consts.surface_conditions.magnetic_field
    .fulgora }

local entity_r                                                        = table.deepcopy(entity)
entity_r.name                                                         = name_r
entity_r.minable.result                                               = name_r
local entity_rl                                                       = table.deepcopy(entity_r)
entity_rl.name                                                        = name_rl
entity_rl.minable.result                                              = name_rl
entity_rl.surface_conditions                                          = { mklv_consts.surface_conditions.magnetic_field
    .fulgora }

local hidden_substation                                               = mklv_hidden_entity("electric-pole",
  "mklv-substation-mk2")

hidden_substation.connection_points                                   = {
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

hidden_substation.fast_replaceable_group                              = entity.fast_replaceable_group
hidden_substation.pictures.layers[1].tint                             = tint
hidden_substation.pictures.layers[1].scale                            = 0.25
-- hidden_substation.pictures.layers[2].tint                             = tint
-- hidden_substation.pictures.layers[2].scale                            = 0.25

local hidden_radar                                                    = mklv_hidden_entity("radar", "mklv-radar-mk2")
hidden_radar.fast_replaceable_group                                   = entity.fast_replaceable_group
hidden_radar.pictures                                                 = {
  filename = "__mklv-lib__/graphics/hidden-entity.png",
  width = 1,
  height = 1,
  direction_count = 1
}

local hidden_lightning_collector                                      = mklv_hidden_entity("lightning-attractor",
  "lightning-collector")
hidden_lightning_collector.fast_replaceable_group                     = entity.fast_replaceable_group

hidden_lightning_collector.chargable_graphics.picture.layers[1].tint  = tint
hidden_lightning_collector.chargable_graphics.picture.layers[1].scale = 0.25
hidden_lightning_collector.chargable_graphics.picture.layers[1].shift = { 0, -0.6 }
hidden_lightning_collector.chargable_graphics.picture.layers[2].scale = 0.25
hidden_lightning_collector.chargable_graphics.picture.layers[2].shift = { 0, -0.6 }

--[[ Item ]] --
local item = table.deepcopy(data.raw.item["mklv-utility-station"])

item.icons = {
  {
    icon = "__base__/graphics/icons/roboport.png",
    scale = 1.7,
    shift = { 0, 24 },
    tint = tint
  },
  {
    icon = "__base__/graphics/icons/substation.png",
    scale = 1.2,
    shift = { 80, -32 },
    tint = tint,
  },
}
item.name = name
item.order = "c[signal]-a[roboport]amu2"
item.place_result = name

--[[ Combined items ]] --
local item_l = table.deepcopy(item)
table.insert(item_l.icons, {
  icon = "__space-age__/graphics/icons/lightning-collector.png",
  scale = 1.2,
  shift = { 32, -32 },
  tint = tint_l
})
item_l.name = name_l
item_l.place_result = name_l

local item_r = table.deepcopy(item)
table.insert(item_r.icons, {
  icon = "__base__/graphics/icons/radar.png",
  scale = 1.2,
  shift = { -16, -32 },
  tint = tint_r
})
item_r.name = name_r
item_r.place_result = name_r

local item_rl = table.deepcopy(item_l)
table.insert(item_rl.icons, {
  icon = "__base__/graphics/icons/radar.png",
  scale = 1.2,
  shift = { -16, -32 },
  tint = tint_rl
})
item_rl.name = name_rl
item_rl.place_result = name_rl

--[[ Recipe ]] --
local recipe = table.deepcopy(data.raw.recipe["mklv-utility-station"])

recipe.category = "crafting-with-fluid"
recipe.name = name
recipe.category_id = "centrifuging"
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

-- TODO: roboport icon should overlay substation etc


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
technology.icons = { {
  icon = "__base__/graphics/technology/logistic-robotics.png",
  icon_size = 256,
  tint = tint,
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
