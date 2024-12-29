--
local on_built = function(data)
  local entity = data.entity --[[@as LuaEntity]]
  if entity.quality.level == 0 then return end
  local surface = entity.surface
  local info = {
    fast_replace = true,
    force = entity.force,
    name = entity.quality.name .. "-" .. entity.name,
    player = entity.last_user,
    position = entity.position,
    quality = entity.quality,
  }
  entity.destroy()
  surface.create_entity(info)
end

local rescans = function(scanners)
  return function()
    for _, surface in pairs(game.surfaces) do
      for _, scanner in pairs(scanners) do
        scanner(surface)
      end
    end
  end
end

-- Helper that handles built event handlers for quality levels
-- @param entity_name string
local quality_init = function(entity_names, scanners)
  local filters = {}
  for _, entity_name in pairs(entity_names) do
    filters[#filters + 1] = {
      filter = "type",
      type = entity_name
    }
  end

  script.on_init(rescans(scanners))
  script.on_event(defines.events.on_built_entity, on_built, filters)
  script.on_event(defines.events.on_robot_built_entity, on_built, filters)
end

return quality_init
