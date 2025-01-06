# Welcome to the art gallery!

**Modern Art** lets you place images and videos around your factory.

Inspired by [YourImage](https://mods.factorio.com/mod/YourImage), I have designed it to support videos and allow users to easily add their own content. Some examples are included with the mod.

![](Example1.png)
![](animations.gif)



# Adding content:

First you must extract Modern Art in your [mods folder](https://wiki.factorio.com/Application_directory). This will override the zip and let you change the content inside. In config.lua you can change what content is active in game. Images and videos should be placed in the graphics folder and need their own subfolders following the example formats.

If there are any updates you will need to extract the new version and merge the configs.

I have included a script to automatically turn videos into game-ready animations using FFmpeg and ImageMagick (you need both installed). It's written in Bash but if someone wants to add Windows support I'll include it with credit.

To use the script simply open terminal in the animations directory, run the script with ./Build_Animation.sh, and point it to your video. Set the scale (.5 is half, 1 is original) and wait for it to complete. At the end you'll have a bunch of images and a config_data.txt with the information you need to add your video to the config. If your video is too long it will lower the framerate to fit within 255 frames.

There are a lot of settings you can change on each picture or video. Examples are included in the config.
```

        --- Required for videos and images ---
	localised_name = "Example Animation",    --- Name that appears in game
	name = "example",                        --- Foldername. No spaces or /. Images must be the same name. Video files must start with 1.png and increase.
	size = {682, 512},                       --- Animation-frame dimensions. Usually ImageX/columns, ImageY/rows rounded down
        --- Required only for videos ---
	framerate = 25,                          --- Animation framerate. Check that it looks good in game
	frame_count = 155,                       --- Total number of animation frames
	files = 13,                              --- Number of animation image files
	width_in_frames = 3,                     --- How many frames wide the images are
	height_in_frames = 4,                    --- How many frames tall the images are
        --- Optional Variables. Listed values are defaults ---
	scale = 1.0,
	localised_description = "",
	icon = "icon.png",                       --- Path to icon file relative to animpath
	icon_size = 256,
	ingredients = {{"iron-plate", 2}, {"iron-gear-wheel", 2}, {"electronic-circuit", 1}},  --- No fluids
	render_layer = "remnants",               --- wiki.factorio.com/Types/RenderLayer
	working_sound = {},                      --- Audio file paths are relative to the base directory. See wiki.factorio.com/Types/WorkingSound
	open_sound = {},                         --- For all other sounds see wiki.factorio.com/Types/Sound
	close_sound = {},
	mining_sound = {},
	mined_sound = {},
	build_sound = {},
	repair_sound = {},
	vehicle_impact_sound = {},
```
I recommend a full text editor like Notepad++ or Kate to help you get the formatting right.

## Removing Content:

Simply remove the relevant lines from config.lua


# Limitations:

Images and videos are limited to 4096x4096 total pixels. I think you can change the aspect ratio but not the total amount.

255 frames in an animation. If anyone has ideas on how to bypass this I'm interested.

Keeping audio synced with video seems impossible. The "persistent" option keeps it running even if you deconstruct the object and desyncs within a few loops. Making it the build sound works the first time but doesn't loop.


# Q&A:
**Help, my game won't load!**

If you're getting an error, read it! Chances are you just forgot a comma or bracket. The syntax for audio files is definitely the hardest option to get right so be sure to carefully read the wiki.

**What's the performance impact?**

¯\\\_(ツ)_/¯ As far as I can test almost nothing. Videos probably scale with framerate and number visible, only those on-screen should impact performance. Using smaller images and videos will help with VRAM. The included files are quite large so you can start by reducing those.

**Multiplayer?**

Should work fine. All players need to have the same content, I'm not sure what will happen otherwise. Audio files might desync.

**Windows video script when?**

When someone else makes it.

**Will you add more content?**

I'm willing to include more but the goal is for you to add your own content. Send me your best (preferrably already converted for the mod) and I'll consider it.

**Support for other mods to add images?**

Man I barely got this working, cross-mod references are hard. Maybe a future update. You can use modded items in recipes though.

**Why doesn't it automatically check folders instead of using a config file?**

Because FactorioHD's code is impossible to read. Also this loads way faster.

**What's that character mod you're using?**

An Okuu engineer replacer, my first and only attempt at using MMD. Animations are goofy, no armor overlays, clips through everything, and it only loads when replacing FactorioHD textures. I might make it my next project if there's demand.

![](okuu.gif)
