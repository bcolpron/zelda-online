#!/bin/bash

echo "var topology=["; echo -n "  "
for j in {0..87}; do
  for i in {0..255}; do
    fingerprint=$(convert ../images/map.png -crop 16x16+$(($i*16))+$(($j*16)) txt: | md5sum|sed s/'  -'//)
    #echo $fingerprint
    grep -q $fingerprint ../data/walkable.txt && echo -n 0, || echo -n 1,
  done
  echo ""; echo -n "  "
done
echo "];"
