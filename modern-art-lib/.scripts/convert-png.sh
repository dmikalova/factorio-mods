#!/bin/sh

for file in ./graphics; do
  magick $file "./$(basename $file ".${file##*.}").png"
done
