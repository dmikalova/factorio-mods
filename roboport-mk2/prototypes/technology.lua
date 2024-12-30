local tint = { r = 178 / 255, g = 173 / 255, b = 100 / 255 }

data:extend({
  {
    type = "technology",
    name = "roboport-mk2",
    icon_size = 256,
    icon_minimaps = 4,
    -- icon = "__base__/graphics/technology/construction-robotics.png",
    icons = { {
      icon = "__base__/graphics/technology/electric-energy-distribution-2.png",
      tint = tint
    } },

    effects = {
      {
        type = "unlock-recipe",
        recipe = "roboport-mk2"
      }
    },
    prerequisites = { "logistic-system" },
    unit = {
      count = 20000,
      ingredients = {
        { "automation-science-pack",      1 },
        { "logistic-science-pack",        1 },
        { "chemical-science-pack",        1 },
        { "production-science-pack",      1 },
        { "utility-science-pack",         1 },
        { "space-science-pack",           1 },
        { "metallurgic-science-pack",     1 },
        { "electromagnetic-science-pack", 1 },
        { "agricultural-science-pack",    1 },
        { "cryogenic-science-pack",       1 },
      },
      time = 30
    },
    order = "c-k-a",
  },
})

-- https://discord.com/channels/139677590393716737/1217401074877599745/1323028268978536561
