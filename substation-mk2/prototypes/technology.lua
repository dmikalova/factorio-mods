data:extend({
  {
    type = "technology",
    name = "substation-mk2",
    icon_size = 256, icon_minimaps = 4,
    icon = "__base__/graphics/technology/construction-robotics.png",
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "substation-mk2"
      }
    },
    prerequisites = {"electric-energy-distribution-2"},
    unit =
    {
      count = 400,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 30
    },
    order = "c-k-a",
  },
})
