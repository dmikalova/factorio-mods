local function combined_entity(prototype, name)
  local entity = table.deepcopy(data.raw[prototype][name])
  entity.collision_box = { { -0, -0 }, { 0, 0 } }
  entity.collision_mask = {
    colliding_with_tiles_only = true,
    layers = {},
    not_colliding_with_itself = true
  }
  entity.flags = {
    "hide-alt-info",
    "no-copy-paste",
    "not-blueprintable",
    "not-deconstructable",
    "not-flammable",
    "not-on-map",
    "not-selectable-in-game",
    "placeable-off-grid",
    "placeable-player",
  }
  entity.combined = true
  entity.combined_in_factoriopedia = true
  entity.max_health = 2147483648
  entity.name = entity.name .. "-combined"
  entity.next_upgrade = nil
  entity.order = "z"
  entity.selection_box = nil
  return entity
end

return combined_entity
