local mklv_consts = require("__mklv-lib__.consts")

--[[ soils
natural-yumako-soil

artificial yumako:
  wetland-yumako

  overgrowth yumako:
  wetland-yumako
  lowland-brown-blubber
  lowland-olive-blubber
  lowland-olive-blubber-2
  lowland-olive-blubber-3
  lowland-pale-green
  wetland-green-slime
  wetland-light-green-slime
  wetland-yumako


natural-jellynut-soil

artificial jellynut:
  wetland-jellynut

overgrowth jellynut:
  wetland-jellynut
  lowland-cream-red
  lowland-red-infection
  lowland-red-vein
  lowland-red-vein-2
  lowland-red-vein-3
  lowland-red-vein-4
  lowland-red-vein-dead
  wetland-pink-tentacle
  wetland-red-tentacle


none:
  gleba-deep-lake
  highland-dark-rock
  highland-dark-rock-2
  highland-yellow-rock
  lowland-brown-blubber
  lowland-cream-cauliflower
  lowland-cream-cauliflower-2
  lowland-dead-skin
  lowland-dead-skin-2
  midland-cracked-lichen
  midland-cracked-lichen-dark
  midland-cracked-lichen-dull
  midland-turquoise-bark
  midland-turquoise-bark-2
  midland-yellow-crust
  midland-yellow-crust-2
  midland-yellow-crust-3
  midland-yellow-crust-4
  pit-rock
  wetland-blue-slime
  wetland-dead-skin
  wetland-light-dead-skin
]]

landfill_weight = 50000

if mods["space-age"] then
  data.raw.item["artificial-jellynut-soil"].weight                       = landfill_weight / 0.75
  data.raw.item["overgrowth-jellynut-soil"].weight                       = landfill_weight / 0.5
  data.raw.item["overgrowth-jellynut-soil"].place_as_tile.tile_condition = {
    "lowland-cream-red",
    "lowland-red-infection",
    "lowland-red-vein-2",
    "lowland-red-vein-3",
    "lowland-red-vein-4",
    "lowland-red-vein-dead",
    "lowland-red-vein",
    "wetland-pink-tentacle",
    "wetland-red-tentacle",
  }

  data.raw.item["artificial-yumako-soil"].weight                         = landfill_weight / 0.75
  data.raw.item["overgrowth-yumako-soil"].weight                         = landfill_weight / 0.5
  data.raw.item["overgrowth-yumako-soil"].place_as_tile.tile_condition   = {
    "lowland-brown-blubber",
    "lowland-olive-blubber-2",
    "lowland-olive-blubber-3",
    "lowland-olive-blubber",
    "lowland-pale-green",
    "wetland-green-slime",
    "wetland-light-green-slime",
  }
end


if mods["mklv-invasive-soils"] then
  local non_fruit_soils = {
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
  }

  data.raw.item["invasive-jellynut-soil"].weight = landfill_weight / 0.25
  data.raw.item["invasive-jellynut-soil"].place_as_tile.tile_condition = non_fruit_soils

  data.raw.item["invasive-yumako-soil"].weight = landfill_weight / 0.25
  data.raw.item["invasive-yumako-soil"].place_as_tile.tile_condition = non_fruit_soils
end

if mods["artificial-tree-soil"] then
  data.raw.item["artificial-tree-soil"].icons[1].icon = "__base__/graphics/icons/landfill.png"
  data.raw.item["artificial-tree-soil"].icons[1].tint = mklv_consts.tints.blue
  data.raw.item["artificial-tree-soil"].order = "c[landfill]-et[artificial-tree-soil]"
  data.raw.item["artificial-tree-soil"].weight = landfill_weight / 0.75
  data.raw.item["artificial-tree-soil"].place_as_tile.tile_condition = {
    "deepwater-green",
    "deepwater",
    "sand-1",
    "water-green",
    "water-mud",
    "water-shallow",
    "water",
  }
end

if mods["waterfill-2"] then
  data.raw.item["waterfill"].order = "e[nauvis]-a[ammoniafill]"
end

if mods["lavafill"] then
  data.raw.item["lavafill"].order = "e[vulcanus]-a[lavafill]"
end

if mods["oilfill"] then
  data.raw.item["oilfill"].order = "e[fulgora]-a[oilfill]"
end

if mods["ammoniafill"] then
  data.raw.item["ammoniafill"].order = "e[aquilo]-a[ammoniafill]"
end
