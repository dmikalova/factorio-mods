local function tint_scale(v)
  return 1 - ((1 - v) / 3)
end

local function tinter(tints)
  for k, v in pairs(tints) do
    tints[k] = {
      r = tint_scale(v.r),
      g = tint_scale(v.g),
      b = tint_scale(v.b),
      a = v.a
    }
  end
  return tints
end

return {
  transfer_ref = {
    lightning_attractor = {
      "chargable_graphics",
      "efficiency",
      "energy_source",
      "lightning_strike_offset",
      "range_elongation",
    },
    substation = {
      type = "electric-pole",
      name = "substation",
      suffix = "",
      attributes = {
        "active_picture",
        "auto_connect_up_to_n_wires",
        "connection_points",
        "draw_circuit_wires",
        "draw_copper_wires",
        "light",
        "maximum_wire_distance",
        "radius_visualisation_picture",
        "supply_area_distance",
        "track_coverage_during_build_by_moving",
      }
    }
  },
  tints = tinter({
    -- source: https://github.com/justarandomgeek/factorio-color-coding/blob/master/prototypes/config.lua
    acid = { r = 0.559, g = 0.761, b = 0.157, a = 1 },
    black = { r = 0.1, g = 0.1, b = 0.1, a = 1 },
    blue = { r = 0.155, g = 0.540, b = 0.898, a = 1 },
    brown = { r = 0.300, g = 0.117, b = 0.0, a = 1 },
    cyan = { r = 0.275, g = 0.755, b = 0.712, a = 1 },
    green = { r = 0.093, g = 0.768, b = 0.172, a = 1 },
    orange = { r = 0.869, g = 0.5, b = 0.130, a = 1 },
    pink = { r = 0.929, g = 0.386, b = 0.514, a = 1 },
    purple = { r = 0.485, g = 0.111, b = 0.659, a = 1 },
    red = { r = 0.815, g = 0.024, b = 0.0, a = 1 },
    white = { r = 1.0, g = 1.0, b = 1.0, a = 1 },
    yellow = { r = 0.835, g = 0.666, b = 0.077, a = 1 },
  }),
  surface_conditions = {
    gravity = {
      any_planet = {
        property = "gravity",
        min = 1,
      },
      space = {
        property = "gravity",
        min = 0,
        max = 0,
      }
    },
    magnetic_field = {
      fulgora = {
        property = "magnetic-field",
        max = 99,
        min = 99,
      }
    },
    pressure = {
      any_plant = {
        property = "pressure",
        min = 1,
      },
      aquilo = {
        property = "pressure",
        min = 300,
        max = 300,
      },
      fulgora = {
        property = "pressure",
        min = 800,
        max = 800,
      },
      gleba = {
        property = "pressure",
        min = 2000,
        max = 2000,
      },
      nauvis = {
        property = "pressure",
        min = 1000,
        max = 1000,
      },
      space = {
        property = "pressure",
        min = 0,
        max = 0,
      },
      vulcanis = {
        property = "pressure",
        min = 4000,
        max = 4000,
      },
    },
  },
}
