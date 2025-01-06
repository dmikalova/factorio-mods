local load = require("__mklv-modern-art-lib__.load")

load({
	imagepath = "__mklv-modern-art-mangione__/graphics/images/",
	animpath = "__mklv-modern-art-mangione__/graphics/animations/",
	images = {
		--[=====[
		{
			localised_name = "Example Image", --- Name that appears in game
			name = "example", --- Foldername. No spaces or /. Image must be the same name.
			size = {1000, 1000}, --- Image dimensions
			--- Optional Variables. Listed values are defaults
			scale = 1.0,
			localised_description = "",
			icon = "icon.png", --- Path to icon file relative to imagepath
			icon_size = 256,
			ingredients = {
				{type = "item", name = "iron-plate", amount = 1},
				{type = "item", name = "wood", amount = 3},
			},
			render_layer = "remnants", --- wiki.factorio.com/Types/RenderLayer
			working_sound = {},  --- Audio file paths are relative to the base directory. See wiki.factorio.com/Types/WorkingSound
			open_sound = {}, --- For all other sounds see wiki.factorio.com/Types/Sound
			close_sound = {},
			mining_sound = {},
			mined_sound = {},
			build_sound = {},
			repair_sound = {},
			vehicle_impact_sound = {},
		},
		--]=====]
		{
			ingredients = { { type = "item", name = "stone", amount = 1 } },
			localised_description = "Luigi Mangione enjoying a day at the beach.",
			localised_name = "Mangione at the beach",
			name = "beach",
			scale = 1,
			size = { 312, 982 },
		},
		{
			ingredients = { { type = "item", name = "advanced-circuit", amount = 1 } },
			localised_description = "Portrait of a freedom fighter.",
			localised_name = "Mancheone",
			name = "che",
			scale = 1,
			size = { 291, 398 },
		},
		{
			ingredients = { { type = "item", name = "holmium-plate", amount = 1 } },
			localised_description = "Always and forever.",
			localised_name = "But daddy!",
			name = "daddy",
			scale = 1,
			size = { 301, 361 },
		},
		{
			ingredients = { { type = "item", name = "railgun-ammo", amount = 1 } },
			localised_description = "Daringly spicy.",
			localised_name = "hot",
			name = "fire",
			scale = 1,
			size = { 907, 1687 },
		},
		{
			ingredients = { { type = "item", name = "supercapacitor", amount = 1 } },
			localised_description = "He's not like the other boys.",
			localised_name = "I can fix him",
			name = "fix-him",
			scale = 1,
			size = { 327, 359 },
		},
		{
			ingredients = { { type = "item", name = "iron-stick", amount = 1 } },
			localised_description = "Deny, Defend, Depose.",
			localised_name = "Free Luigi",
			name = "free-luigi",
			scale = 1,
			size = { 502, 321 },
		},
		{
			ingredients = { { type = "item", name = "iron-gear-wheel", amount = 1 } },
			localised_description = "",
			localised_name = "Free My Man",
			name = "free-my-man",
			scale = 1,
			size = { 172, 200 },
		},
		{
			ingredients = { { type = "item", name = "jelly", amount = 1 } },
			localised_description = "",
			localised_name = "Luigi on a hike",
			name = "hike",
			scale = 1,
			size = { 684, 798 },
		},
		{
			ingredients = { { type = "item", name = "superconductor", amount = 1 } },
			localised_description = "",
			localised_name = "MgDonalds Smile",
			name = "mcd",
			scale = 1,
			size = { 261, 393 },
		},
		{
			ingredients = { { type = "item", name = "ice", amount = 1 } },
			localised_description = "Enjoying a relaxing day out and about.",
			localised_name = "Luigi Mangione at the park",
			name = "park",
			scale = 1,
			size = { 816, 1194 },
		},
		{
			ingredients = { { type = "item", name = "electric-engine-unit", amount = 1 } },
			localised_description = "Like Jesus before the Romans.",
			localised_name = "Perp Walk",
			name = "perp-walk",
			scale = 1,
			size = { 249, 419 },
		},
		{
			ingredients = { { type = "item", name = "plastic-bar", amount = 1 } },
			localised_description = "A true connoisseur of fine culture.",
			localised_name = "Luigi Mangione at the Philadelphia Museum of Art",
			name = "philly",
			scale = 1,
			size = { 225, 351 },
		},
		{
			ingredients = { { type = "item", name = "rocket-fuel", amount = 1 } },
			localised_description = "He wiped the competition.",
			localised_name = "Proleratians' Person of the Year",
			name = "prole",
			scale = 1,
			size = { 500, 704 },
		},
		{
			ingredients = { { type = "item", name = "solid-fuel", amount = 1 } },
			localised_description = "",
			localised_name = "Luigi Mangione wearing a red sweater",
			name = "red-sweater",
			scale = 1,
			size = { 369, 335 },
		},
		{
			ingredients = { { type = "item", name = "uranium-rounds-magazine", amount = 1 } },
			localised_description = "Known for his courage and selflessness.",
			localised_name = "Patron Saint Mangione",
			name = "saint",
			scale = 1,
			size = { 478, 783 },
		},
	},
	animations = {
		--[=====[{
			localised_name = "Example Animation", --- Name that appears in game
			name = "example", --- Foldername. No spaces or /. Images must start with 1.png and increase.
			size = {682, 512}, --- Animation-frame dimensions. Usually ImageX/columns, ImageY/rows rounded down
			framerate = 25, --- Animation framerate. Check that it looks good in game
			frame_count = 155, --- Total number of animation frames
			files = 4, --- Number of animation image files
			width_in_frames = 3, --- How many frames wide the images are
			height_in_frames = 4, --- How many frames tall the images are
			--- Optional Variables. Listed values are defaults
			scale = 1.0,
			localised_description = "",
			icon = "icon.png", --- Path to icon file relative to animpath
			icon_size = 256,
			ingredients = {
				{type = "item", name = "iron-plate", amount = 2},
				{type = "item", name = "iron-gear-wheel", amount = 2},
				{type = "item", name = "electronic-circuit", amount = 1}
			},
			render_layer = "remnants", --- wiki.factorio.com/Types/RenderLayer
			working_sound = {},  --- Audio file paths are relative to the base directory. See wiki.factorio.com/Types/WorkingSound
			open_sound = {}, --- For all other sounds see wiki.factorio.com/Types/Sound
			close_sound = {},
			mining_sound = {},
			mined_sound = {},
			build_sound = {},
			repair_sound = {},
			vehicle_impact_sound = {},
		},	--]=====]
	},
})
