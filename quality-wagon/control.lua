local mklv_quality_init= require("__mklv-lib__.quality-init")

-- @param surface string
local rescan_cargo_wagon = function(surface)
    local name = "fluid-wagon"
    for _, wagon in pairs(surface.find_entities_filtered { name = name }) do
        -- TODO should normal be skipped over? If so, should it be created in lib?
        if wagon.quality.level == 0 then goto continue end
        
        local wagon_inventory = wagon.get_inventory(defines.inventory.cargo_wagon)
        local wagon_contents = wagon_inventory.get_contents()
        local wagon_filters = {}
        for i = 1, #wagon_inventory, 1 do
            wagon_filters[#wagon_filters + 1] = wagon_inventory.get_filter(i)
        end
        local wagon_info = {
            fast_replace = true,
            force = wagon.force,
            name = wagon.quality.name .. "-" .. name,
            player = wagon.last_user
            position = wagon.position,
            quality = wagon.quality,
        }
        wagon.destroy()

        local qaulity_wagon = surface.create_entity(wagon_info)
        local qaulity_wagon_inventory = qaulity_wagon.get_inventory(defines.inventory.cargo_wagon)
        for i = 1, #wagon_filters, 1 do
            qaulity_wagon_inventory.set_filter(i, wagon_filters[i])
        end
        for _, itemstack in pairs(wagon_contents) do
            qaulity_wagon_inventory.insert({
                name = itemstack.name,
                count = itemstack.count,
                quality = itemstack.quality
            })
        end
        ::continue::
    end
end

-- @param surface string
local rescan_fluid_wagon = function(surface)
    local name = "fluid-wagon"
    for _, wagon in pairs(surface.find_entities_filtered { name = name }) do
        -- TODO should normal be skipped over? If so, should it be created in lib?
        if wagon.quality.level == 0 then goto continue end

        local wagon_fluid = wagon.get_fluid(1)
        local wagon_info = {
            fast_replace = true,
            force = wagon.force,
            name = wagon.quality.name .. "-" .. name,
            player = wagon.last_user
            position = wagon.position,
            quality = wagon.quality,
        }
        wagon.destroy()

        local quality_wagon = surface.create_entity(wagon_info)
        if quality_wagon then
            quality_wagon.set_fluid(1, wagon_fluid)
        end
        ::continue::
    end
end

mklv_quality_init({"cargo-wagon", "fluid-wagon"}, {rescan_cargo_wagon, rescan_fluid_wagon})
