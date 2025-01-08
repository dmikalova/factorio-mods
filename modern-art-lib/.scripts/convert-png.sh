#!/bin/sh

# Convert all images to PNG
for file in ./*; do
  if [ -f "$file" ]; then
    if echo "$file" | grep -qv '.*.png'; then
      echo "Converting $file to PNG"
      magick "$file" "./$(basename "$file" ".${file##*.}").png"
      rm "$file"
    fi
  fi
done

# # Trim borders - can be destructive with non-transparent borders
# for file in ./*.png; do
#   if [ -f "$file" ]; then
#     echo "Trimming $file borders"
#     magick "$file" -bordercolor none -border 10 "$file"
#     magick "$file" -fuzz 25% -trim "$file"
#   fi
# done

# Add 256x256 icon for each image
for file in ./*.png; do
  if [ -f "$file" ]; then
    if echo "$file" | grep -qv '.*icon.*'; then
      echo "Makig $file icon"
      magick "$file" \
        -background none \
        -resize 256x256 \
        -gravity center \
        -extent 256x256 \
        "$(basename "$file" ".${file##*.}")-icon.png"
    fi
  fi
done

# Optimize PNGs
for file in ./*.png; do
  if [ -f "$file" ]; then
    echo "Optimizing $file"
    optipng -clobber "$file"
  fi
done
