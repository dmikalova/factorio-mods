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
  tints = {
    mk1 = {
      r = 255 / 255,
      g = 230 / 255,
      b = 200 / 255,
    },
    mk2 = {
      r = 230 / 255,
      g = 255 / 255,
      b = 200 / 255,
    },
  },
  surface_conditions = {
    pressure = {
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
