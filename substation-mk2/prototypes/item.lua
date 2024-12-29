local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "substation-mk2",
    icon = "__mklv-substation-mk2__/graphics/icons/substation-mk2.png",
    -- icon_size = 64, icon_mipmaps = 4,
    subgroup = "energy",
    order = "z-a[energy]-d[substation]",
    place_result = "substation-mk2",
    stack_size = 50,
    -- inventory_move_sound = item_sounds.electric_large_inventory_move,
    -- pick_sound = item_sounds.electric_large_inventory_pickup,
    -- drop_sound = item_sounds.electric_large_inventory_move,
  },
})

