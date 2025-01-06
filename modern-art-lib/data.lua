-- create group
data:extend(
  {
    {
      type = "item-group",
      name = "images-tabs",
      localised_name = "Images",
      order = "zzz",
      icon = "__mklv-modern-art-lib__/icon.png",
      icon_size = 256
    },
    {
      type = "item-subgroup",
      name = "images-image",
      group = "images-tabs",
      order = "aa",
    },
    {
      type = "item-subgroup",
      name = "images-animation",
      group = "images-tabs",
      order = "ba",
    },
  }
)
