#!/bin/sh

for file in ./*; do
  magick $file \
    -background none \
    -resize 256x256 \
    -gravity center \
    -extent 256x256 \
    "$(basename $file ".${file##*.}")-icon.png"
done
