local entities = {
  ["mklv-utility-station"] = true,
}

local function build_entity(event, name)
  local e = event.entity
  local s = e.surface
  local x = e.position.x
  local y = e.position.y
  local l = s.create_entity {
    force = game.forces.neutral,
    name = name,
    position = { x, y },
    quality = e.quality,
  }
  l.destructible = false
end

local function build(event)
  -- game.players[1].print("build")

  if entities[event.entity.name] then
    build_entity(event, "substation-combined")
  end
end

local function destroy_entity(event, name)
  local e = event.entity
  local x = e.position.x
  local y = e.position.y
  local entity = e.surface.find_entity({ name = name, quality = e.quality }, { x, y })
  if entity ~= nil then
    entity.destroy()
  end
end

local function destroy(event)
  -- game.players[1].print("destroy")

  if entities[event.entity.name] then
    destroy_entity(event, "substation-combined")
  end
end

local filters = {};
for entity, _ in pairs(entities) do
  filters[#filters + 1] = {
    filter = "name",
    name = entity
  }
end

script.on_event(defines.events.on_built_entity, build, filters)
script.on_event(defines.events.on_robot_built_entity, build, filters)

script.on_event(defines.events.on_entity_died, destroy, filters)
script.on_event(defines.events.on_player_mined_entity, destroy, filters)
script.on_event(defines.events.on_robot_pre_mined, destroy, filters)
script.on_event(defines.events.script_raised_destroy, destroy, filters)
