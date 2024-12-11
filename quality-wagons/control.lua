local on_built = function(data)
  local entity = data.entity --[[@as LuaEntity]]
  if entity.quality.level == 0 then return end
  local surface = entity.surface
  local info = {
      name = entity.quality.name .. "-" .. entity.name,
      position = entity.position,
      quality = entity.quality,
      force = entity.force,
      fast_replace = true,
      player = entity.last_user,
  }
  entity.destroy()
  surface.create_entity(info)
end

local rescan = function()
  for _, surface in pairs(game.surfaces) do
      for _, wagon in pairs(surface.find_entities_filtered { name = "fluid-wagon" }) do
          if wagon.quality.level == 0 then goto continue end
          local s_fluid = wagon.get_fluid(1)
          local info = {
              name = wagon.quality.name .. "-fluid-wagon",
              position = wagon.position,
              quality = wagon.quality,
              fast_replace = true,
              force = wagon.force,
              player = wagon.last_user
          }
          wagon.destroy()
          local wagon2 = surface.create_entity(info)
          if wagon2 then
              wagon2.set_fluid(1, s_fluid)
          end
          ::continue::
      end
      for _, wagon in pairs(surface.find_entities_filtered { name = "cargo-wagon" }) do
          if wagon.quality.level == 0 then goto continue end
          local wagon_inventory = wagon.get_inventory(defines.inventory.cargo_wagon)
          local wagon_contents = wagon_inventory.get_contents()
          local wagon_filters = {}
          for i = 1, #wagon_inventory, 1 do
              wagon_filters[#wagon_filters + 1] = wagon_inventory.get_filter(i)
          end
          local info = {
              name = wagon.quality.name .. "-cargo-wagon",
              position = wagon.position,
              quality = wagon.quality,
              fast_replace = true,
              force = wagon.force,
              player = wagon.last_user
          }
          wagon.destroy()
          local wagon2 = surface.create_entity(info)
          local wagon2_inventory = wagon2.get_inventory(defines.inventory.cargo_wagon)
          for i = 1, #wagon_filters, 1 do
              wagon2_inventory.set_filter(i, wagon_filters[i])
          end
          for _, itemstack in pairs(wagon_contents) do
              wagon2_inventory.insert({
                  name = itemstack.name,
                  count = itemstack.count,
                  quality = itemstack.quality
              })
          end
          ::continue::
      end
  end
end

local cargo_wagon_filter = {
  filter = "type",
  type = "cargo-wagon"
}

local fluid_wagon_filter = {
  filter = "type",
  type = "fluid-wagon"
}

script.on_init(rescan)

script.on_event(defines.events.on_built_entity, on_built, { cargo_wagon_filter, fluid_wagon_filter })
script.on_event(defines.events.on_robot_built_entity, on_built, { cargo_wagon_filter, fluid_wagon_filter })
