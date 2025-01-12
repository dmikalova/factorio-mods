#!/bin/bash

GRAPHICS_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../graphics" &>/dev/null && pwd)
DATA_TABLE=$GRAPHICS_DIR/data-table

rm -f "$DATA_TABLE"
SEED0=tree
SEED1=jellynut
SEED2=yumako

i=0
for file in "$GRAPHICS_DIR/images/"*; do
  if [ -f "$file" ]; then
    printf -v N "%02d" "$i"
    W=$(identify -format "%w" "$file")
    H=$(identify -format "%h" "$file")

    case $((i % 3)) in
    0) SEED=$SEED0 ;;
    1) SEED=$SEED1 ;;
    2) SEED=$SEED2 ;;
    esac
    echo "Plant ${N}: ${W}x${H} (${SEED})"

    cat >>"$DATA_TABLE" <<EOF
{
  ingredients = { { type = "item", name = $SEED, amount = 1 } },
  localised_description = "",
  localised_name = "Plant ${i}",
  name = "potted-plant-${N}",
  scale = 0.3,
  size = { ${W}, ${H} },
},
EOF

    i=$((i + 1))
  fi
done
