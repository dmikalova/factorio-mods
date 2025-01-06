local entities = {
  ["mklv-utility-station"] = true,
  ["mklv-utility-station-l"] = true,
  ["mklv-utility-station-lr"] = true,
  ["mklv-utility-station-r"] = true,
}

local entities_l = {
  ["mklv-utility-station-l"] = true,
  ["mklv-utility-station-lr"] = true,
}

local entities_r = {
  ["mklv-utility-station-lr"] = true,
  ["mklv-utility-station-r"] = true,
}

local function build_entity(event, name)
  local e = event.entity
  local s = e.surface
  local x = e.position.x
  local y = e.position.y
  local l = s.create_entity {
    name = name,
    position = { x, y },
    force = game.forces.neutral
  }
  l.destructible = false
end

local function build(event)
  game.players[1].print("build")

  if entities[event.entity.name] then
    game.players[1].print("substation")
    build_entity(event, "mklv-substation-invisible")
  end
  game.players[1].print("event " .. event.entity.name)
  -- game.players[1].print("l " .. entities_l[1])
  -- game.players[1].print("l " .. entities_l[2])


  if entities_l[event.entity.name] then
    game.players[1].print("lightning")
    build_entity(event, "mklv-lightning-collector-invisible")
  end

  if entities_r[event.entity.name] then
    game.players[1].print("radar")
    build_entity(event, "mklv-radar-invisible")
  end
end

local function destroy_entity(event, name)
  local s = event.entity
  local x = s.position.x
  local y = s.position.y
  local entity = s.surface.find_entity(name, { x, y })
  if entity ~= nil then
    entity.destroy()
  end
end

local function destroy(event)
  game.players[1].print("destroy")

  if entities[event.entity.name] then
    destroy_entity(event, "mklv-substation-invisible")
  end

  if entities_l[event.entity.name] then
    destroy_entity(event, "mklv-lightning-collector-invisible")
  end

  if entities_r[event.entity.name] then
    destroy_entity(event, "mklv-radar-invisible")
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

-- script.on_event(defines.events.on_preplayer_mined_item, destroy, filters)
script.on_event(defines.events.on_entity_died, destroy, filters)
script.on_event(defines.events.on_player_mined_entity, destroy, filters)
script.on_event(defines.events.on_robot_pre_mined, destroy, filters)
script.on_event(defines.events.script_raised_destroy, destroy, filters)
