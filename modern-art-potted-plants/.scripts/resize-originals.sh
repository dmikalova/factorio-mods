#!/bin/bash

GRAPHICS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../graphics" &>/dev/null && pwd)

for file in "$GRAPHICS_DIR/originals/"*.png; do
  if [ -f "$file" ]; then
    file=$(basename "$file")
    # echo "Resizing $(basename "$file") to 320x"
    # echo "original $GRAPHICS_DIR/originals/$file"
    # echo "image $GRAPHICS_DIR/images/${file}"
    magick "$GRAPHICS_DIR/originals/$file" -resize 320x "$GRAPHICS_DIR/images/${file}"
  fi
done
