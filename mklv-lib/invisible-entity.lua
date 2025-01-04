local function invisible_entity(prototype, name)
  entity = table.deepcopy(data.raw[prototype][name])
  entity.collision_box = { { -0, -0 }, { 0, 0 } }
  -- entity.collision_mask = {}
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
  entity.name = "mklv-" .. entity.name .. "-invisible"
  entity.order = "z"
  entity.selection_box = nil
  entity.pictures = {
    filename = "__mklv-lib__/graphics/invisible_entity.png",
    width = 1,
    height = 1,
    direction_count = 1
  }
  entity.connection_points = {
  	{
  		shadow = {
  			copper = {0, -0.2},
  			red = {0, 0},
  			green = {0, 0}
  		},
  		wire = {
  			copper = {0, -0.2},
  			red = {0, 0},
  			green = {0, 0}
  		}
  	}
  }
  return entity
end

return invisible_entity
