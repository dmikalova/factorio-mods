-- create group
data:extend(
  {
    {
      icon = "__mklv-modern-art-lib__/item-group-icon.png",
      icon_size = 256,
      localised_name = "Images",
      name = "images-tabs",
      order = "zzz",
      type = "item-group",
    },
    {
      group = "images-tabs",
      name = "images-image",
      order = "aa",
      type = "item-subgroup",
    },
    {
      group = "images-tabs",
      name = "images-animation",
      order = "ba",
      type = "item-subgroup",
    },
  }
)
