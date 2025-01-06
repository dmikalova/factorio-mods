local function load(config)
  -- create images
  -- I'm still mad I have two whole sets of item, entity, recipe instead of just one. Script is twice as long as it should be. Can't figure out how to combine them without redesigning config
  for key, content in pairs(config.images) do
    local imgcontent =
    {
      {
        animation =
        {
          priority = "low",
          flags = { "linear-magnification", "no-crop", "linear-minification", "group=low-object" },
          filename = config.imagepath .. content.name .. ".png",
          size = content.size,
        },
        ---     User optional variables
        render_layer = "floor",
      }
    }

    local item =
    {
      stack_size = 1,
      name = "ma-" .. content.name,
      localised_name = content.localised_name,
      place_result = "ma-" .. content.name,
      subgroup = "images-image",
      type = "item",
      --- User optional variables
      icon = config.imagepath .. content.name .. "-icon.png",
      icon_size = 256,
    }
    local recipe =
    {
      name = "ma-" .. content.name,
      results = { { type = "item", name = "ma-" .. content.name, amount = 1 } },
      type = "recipe",
      --- User optional variables
      ingredients = {
        { type = "item", name = "iron-plate", amount = 1 },
        { type = "item", name = "wood",       amount = 3 }
      },
      allow_quality = false
    }
    local entity =
    {
      energy_source = { type = "void", usage_priority = "secondary-input" },
      type = "beacon",
      energy_usage = "1W",
      module_slots = 0,
      supply_area_distance = 0,
      distribution_effectivity = 0,
      max_health = 100,
      module_specification = {},
      flags = { "placeable-neutral", "player-creation", "not-on-map" },
      minable = { mining_time = 0.15, results = { { type = "item", name = "ma-" .. content.name, amount = 1 } } },
      collision_box = { { -0, -0 }, { 0, 0 } },
      selection_box = { { -2, -2 }, { 2, 2 } },
      collision_mask = { layers = { floor = true }, colliding_with_tiles_only = true },
      name = "ma-" .. content.name,
      localised_name = content.localised_name,
      graphics_set = { animation_list = imgcontent },
      se_allow_in_space = true,
      ---   User optional variables
      icon = config.imagepath .. content.name .. "-icon.png",
      icon_size = 256,
    }
    ---   User optional variables
    if content.scale ~= nil then
      entity["graphics_set"]["animation_list"][1]["animation"]["scale"] = content.scale
    end
    if content.localised_description ~= nil then
      item["localised_description"] = content.localised_description
      entity["localised_description"] = content.localised_description
    end
    if content.icon ~= nil then
      item["icon"] = config.imagepath .. content.icon
      entity["icon"] = config.imagepath .. content.icon
    end
    if content.icon_size ~= nil then
      item["icon_size"] = content.icon_size
      entity["icon_size"] = content.icon_size
    end
    if content.ingredients ~= nil then
      recipe["ingredients"] = content.ingredients
    end
    if content.render_layer ~= nil then
      entity["graphics_set"]["animation_list"][1]["render_layer"] = content.render_layer
    end
    if content.working_sound ~= nil then
      entity["working_sound"] = content.working_sound
    end
    if content.open_sound ~= nil then
      entity["open_sound"] = content.open_sound
    end
    if content.close_sound ~= nil then
      entity["close_sound"] = content.close_sound
    end
    if content.mining_sound ~= nil then
      entity["mining_sound"] = content.mining_sound
    end
    if content.mined_sound ~= nil then
      entity["mined_sound"] = content.mined_sound
    end
    if content.build_sound ~= nil then
      entity["build_sound"] = content.build_sound
    end
    if content.repair_sound ~= nil then
      entity["repair_sound"] = content.repair_sound
    end
    if content.vehicle_impact_sound ~= nil then
      entity["vehicle_impact_sound"] = content.vehicle_impact_sound
    end

    data:extend { item, recipe, entity }
  end

  -- create animations

  for key, content in pairs(config.animations) do
    local animcontent =
    {
      {
        animation =
        {
          priority = "low",
          flags = { "linear-magnification", "no-crop", "linear-minification" },
          size = content.size,
          frame_count = content.frame_count,
          animation_speed = content.framerate / 60,
          stripes = {},
        },
        ---   User optional variables
        render_layer = "floor",
      }
    }
    --- Create stripes for every animation file in the folder
    for len = 1, content.files do
      local animcontent2 =
      {
        filename = config.animpath .. content.name .. "/" .. len .. ".png",
        width_in_frames = content.width_in_frames,
        height_in_frames = content.height_in_frames,
      }
      table.insert(animcontent[1]["animation"]["stripes"], animcontent2)
    end

    local item =
    {
      stack_size = 1,
      name = "ma-" .. content.name,
      localised_name = content.localised_name,
      place_result = "ma-" .. content.name,
      subgroup = "images-animation",
      type = "item",
      --- User optional variables
      icon = config.animpath .. "icon.png",
      icon_size = 256,
    }
    local recipe =
    {
      name = "ma-" .. content.name,
      results = { { type = "item", name = "ma-" .. content.name, amount = 1 } },
      type = "recipe",
      --- User optional variables
      ingredients = {
        { type = "item", name = "iron-plate",         amount = 2 },
        { type = "item", name = "iron-gear-wheel",    amount = 2 },
        { type = "item", name = "electronic-circuit", amount = 1 }
      },
      allow_quality = false
    }
    local entity =
    {
      energy_source = { type = "void", usage_priority = "secondary-input" },
      type = "beacon",
      energy_usage = "1W",
      module_slots = 0,
      supply_area_distance = 0,
      distribution_effectivity = 0,
      max_health = 100,
      module_specification = {},
      flags = { "placeable-neutral", "player-creation", "not-on-map" },
      minable = { mining_time = 0.15, results = { { type = "item", name = "ma-" .. content.name, amount = 1 } } },
      collision_box = { { -0, -0 }, { 0, 0 } },
      selection_box = { { -2, -2 }, { 2, 2 } },
      collision_mask = { layers = { floor = true }, colliding_with_tiles_only = true },
      name = "ma-" .. content.name,
      localised_name = content.localised_name,
      graphics_set = { animation_list = animcontent },
      se_allow_in_space = true,
      ---   User optional variables
      icon = config.animpath .. "icon.png",
      icon_size = 256,
    }
    --     local quality =
    --     {
    --       type = "quality"
    --       name =
    --       color
    --       level
    --     }
    ---   User optional variables
    if content.scale ~= nil then
      entity["graphics_set"]["animation_list"][1]["animation"]["scale"] = content.scale
    end
    if content.localised_description ~= nil then
      item["localised_description"] = content.localised_description
      entity["localised_description"] = content.localised_description
    end
    if content.icon ~= nil then
      item["icon"] = config.animpath .. content.icon
      entity["icon"] = config.animpath .. content.icon
    end
    if content.icon_size ~= nil then
      item["icon_size"] = content.icon_size
      entity["icon_size"] = content.icon_size
    end
    if content.ingredients ~= nil then
      recipe["ingredients"] = content.ingredients
    end
    if content.render_layer ~= nil then
      entity["graphics_set"]["animation_list"][1]["render_layer"] = content.render_layer
    end
    if content.working_sound ~= nil then
      entity["working_sound"] = content.working_sound
    end
    if content.open_sound ~= nil then
      entity["open_sound"] = content.open_sound
    end
    if content.close_sound ~= nil then
      entity["close_sound"] = content.close_sound
    end
    if content.mining_sound ~= nil then
      entity["mining_sound"] = content.mining_sound
    end
    if content.mined_sound ~= nil then
      entity["mined_sound"] = content.mined_sound
    end
    if content.build_sound ~= nil then
      entity["build_sound"] = content.build_sound
    end
    if content.repair_sound ~= nil then
      entity["repair_sound"] = content.repair_sound
    end
    if content.vehicle_impact_sound ~= nil then
      entity["vehicle_impact_sound"] = content.vehicle_impact_sound
    end

    data:extend { item, recipe, entity }
  end

  --log("blabla " .. serpent.block(entity))  --- useful for finding issues in tables. lots of nested brackets here
end

return load
