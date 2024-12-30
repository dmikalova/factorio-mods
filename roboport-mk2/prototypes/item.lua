local item_sounds = require("__base__.prototypes.item_sounds")
local tint = { r = 178 / 255, g = 173 / 255, b = 100 / 255 }

data:extend({
  {
    type = "item",
    name = "roboport-mk2",
    -- icon = "__mklv-roboport-mk2__/graphics/icons/roboport-mk2.png",
    icons = { { icon = "__base__/graphics/icons/roboport.png", tint = tint } },

    -- icon_size = 64, icon_mipmaps = 4,
    subgroup = "signal",
    order = "z-a[signal]-d[roboport]",
    place_result = "roboport-mk2",
    stack_size = 10,
    -- inventory_move_sound = item_sounds.electric_large_inventory_move,
    -- pick_sound = item_sounds.electric_large_inventory_pickup,
    -- drop_sound = item_sounds.electric_large_inventory_move,
  },
})

