require("__mkv-lib-quality__.file")

for _, q in pairs(data.raw["quality"]) do
  local k = q.name
  local v = 1 + 0.3 * q.level

  local cargo_wagon = table.deepcopy(data.raw["cargo-wagon"]["cargo-wagon"])
  cargo_wagon.name = k.."-"..cargo_wagon.name
  cargo_wagon.inventory_size = cargo_wagon.inventory_size * v
  cargo_wagon.localised_name = {"entity-name.cargo-wagon"}
  cargo_wagon.localised_description = {"entity-description.cargo-wagon"}
  cargo_wagon.placeable_by = {item = "cargo-wagon", count = 1, quality = k}

  local fluid_wagon = table.deepcopy(data.raw["fluid-wagon"]["fluid-wagon"])
  fluid_wagon.name = k.."-"..fluid_wagon.name
  fluid_wagon.capacity = fluid_wagon.capacity * v
  fluid_wagon.localised_name = {"entity-name.fluid-wagon"}
  fluid_wagon.localised_description = {"entity-description.fluid-wagon"}
  fluid_wagon.placeable_by = {item = "fluid-wagon", count = 1, quality = k}

  data:extend{cargo_wagon, fluid_wagon}
end
