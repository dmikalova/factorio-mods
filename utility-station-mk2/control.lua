local entities = {
  ["mklv-utility-station-mk2-l"] = true,
  ["mklv-utility-station-mk2-r"] = true,
  ["mklv-utility-station-mk2-rl"] = true,
  ["mklv-utility-station-mk2"] = true,
}

local entities_l = {
  ["mklv-utility-station-mk2-l"] = true,
  ["mklv-utility-station-mk2-rl"] = true,
}

local entities_r = {
  ["mklv-utility-station-mk2-r"] = true,
  ["mklv-utility-station-mk2-rl"] = true,
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
    -- game.players[1].print("substation")
    build_entity(event, "mklv-substation-mk2-combined")
  end
  -- game.players[1].print("event " .. event.entity.name)


  if entities_l[event.entity.name] then
    -- game.players[1].print("lightning")
    build_entity(event, "lightning-collector-combined")
  end

  if entities_r[event.entity.name] then
    -- game.players[1].print("radar")
    build_entity(event, "mklv-radar-mk2-combined")
  end
end

local function destroy_entity(event, name)
  local e = event.entity
  local x = e.position.x
  local y = e.position.y
  -- game.players[1].print("destroy_entity " .. name .. e.quality.level .. e.quality.name)
  local entity = e.surface.find_entity({ name = name, quality = e.quality.name }, { x, y })
  if entity ~= nil then
    entity.destroy()
  end
end

local function destroy(event)
  -- game.players[1].print("destroy")

  if entities[event.entity.name] then
    destroy_entity(event, "mklv-substation-mk2-combined")
  end

  if entities_l[event.entity.name] then
    destroy_entity(event, "lightning-collector-combined")
  end

  if entities_r[event.entity.name] then
    destroy_entity(event, "mklv-radar-mk2-combined")
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
