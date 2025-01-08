#!/bin/bash

rm ../data-table
SEED0=tree-seed
SEED1=jellynut-seed
SEED2=yumako-seed

i=0
for file in ./*; do
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

    cat >>./data-table <<EOF
{
  ingredients = { { type = "item", name = "$SEED", amount = 1 } },
  localised_description = "",
  localised_name = "Plant ${i}",
  name = "potted-plant-${N}",
  scale = 1,
  size = { ${W}, ${H} },
},
EOF

    i=$((i + 1))
  fi
done
