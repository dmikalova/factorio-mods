# Welcome to the Modern Art Library!

**Modern Art Library** lets you make mods to place images and videos around the factory.

Based on [Modern Art](https://mods.factorio.com/mod/ModernArt) which was inspired by [YourImage](https://mods.factorio.com/mod/YourImage), this mod makes it easy to make more mod packs of true modern art.

## Creating your own Modern Art Packs

See [Modern Art: Mangine Pack](https://mods.factorio.com/mod/ModernArt) for an example. You can download that mod, edit it to your liking, and upload it to the mod portal.

In detail:

- Create an `info.json` file with your information, and add this lib as a dependency.
- Create a `data.lua` and import the load function from this lib:

  ```lua
    local load = require("__mklv-modern-art-lib__.load")

    load({
      imagepath = "__mklv-modern-art-mangione__/graphics/images/",
      images = { ... },
      animpath = "__mklv-modern-art-mangione__/graphics/animations/",
      animations = { ... },
    })
  ```

  - Fill out the `images` and `animations` sections. See `load.lua` for more options:

  ```lua
    images = {
      {
      ingredients = { { type = "item", name = "iron-plate", amount = 1 } },
      localised_description = "Example description.",
      localised_name = "Example name",
      name = "example-name",
      scale = 1,
      size = { 256, 256 },
     },
    }
  ```

  - Add your images and animations to the `graphics/images` folder - by default the images follow the naming format of `$NAME.png`. See `.scripts/convert-png.sh` for a script to convert all your images to png.
  - Add a 256x256 icon for each image to the `graphics/images` folder - by default the icons follow the naming format of `$NAME-icon.png`.
  - The mod should now be ready. You can add it to your Factorio mod directory to test it out, share it with friends, and upload it to the mod portal.

## Limitations

Images and videos are limited to 4096x4096 total pixels. I think you can change the aspect ratio but not the total amount.

255 frames in an animation. If anyone has ideas on how to bypass this I'm interested.

Keeping audio synced with video seems impossible. The "persistent" option keeps it running even if you deconstruct the object and desyncs within a few loops. Making it the build sound works the first time but doesn't loop.
