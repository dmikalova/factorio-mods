-- Add a bonus for each quality level - works on all quality levels using their default level (bonus multiplier)
-- For example, quality_add_bonus("cargo-wagon", "inventory_size") will multiply the inventory size of the cargo-wagon by the quality   level
-- @param entity_name string
-- @param property string
local function quality_add_bonus(entity_name, property)
  local raw = data.raw
  for _, q in pairs(raw["quality"]) do
    -- Name of the quality - ie Normal, Uncommon, Rare, Epic, Legendary
    local quality_name = q.name
    -- Level of the quality - ie N:0, U:1, R:2, E:3, L:5
    -- Bonus multiplier of the quality - ie N:1, U:1.3, R:1.6, E:1.9, L:2.5
    local quality_mult = 1 + q.level * 0.3

    local entity = table.deepcopy(raw[entity_name][entity_name])
    entity.name = quality_name .. "-" .. entity.name
    entity[property] = entity[property] * quality_mult
    entity.localised_name = { "entity-name." .. entity_name }
    entity.localised_description = { "entity-description." .. entity_name }
    entity.placeable_by = { item = entity_name, count = 1, quality = quality_name }

    data:extend { entity }
  end
end

return quality_add_bonus
