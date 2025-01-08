#!/bin/sh

# Convert all images to PNG
for file in ./*; do
  if [ -f "$file" ]; then
    magick "$file" "./$(basename "$file" ".${file##*.}").png"
  fi
done

# Trim borders and optimize PNGs
for file in ./*.png; do
  if [ -f "$file" ]; then
    magick "$file" -fuzz 25% -trim "$file"
    optipng -clobber "$file"
  fi
done

# Add 256x256 icon for each image
for file in ./*.png; do
  if [ -f "$file" ]; then
    if echo "$file" | grep -qv '.*icon.*'; then
      echo "$file"
      magick "$file" \
        -background none \
        -resize 256x256 \
        -gravity center \
        -extent 256x256 \
        "$(basename "$file" ".${file##*.}")-icon.png"
    fi
  fi
done
