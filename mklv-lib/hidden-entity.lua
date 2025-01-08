local function hidden_entity(prototype, name)
  entity = table.deepcopy(data.raw[prototype][name])
  entity.collision_box = { { -0, -0 }, { 0, 0 } }
  entity.collision_mask = {
    colliding_with_tiles_only = true,
    layers = {},
    not_colliding_with_itself = true
  }
  entity.flags = {
    -- "hidden",
    "hide-alt-info",
    "no-copy-paste",
    "not-blueprintable",
    "not-deconstructable",
    "not-flammable",
    "not-on-map",
    "not-selectable-in-game",
    "not-upgradable",
    "placeable-off-grid",
    "placeable-player",
  }
  entity.max_health = 2147483648
  entity.name = "mklv-" .. entity.name .. "-hidden"
  entity.order = "z"
  entity.selection_box = nil
  entity.pictures = {
    filename = "__mklv-lib__/graphics/hidden_entity.png",
    width = 1,
    height = 1,
    direction_count = 1
  }
  return entity
end

return hidden_entity
