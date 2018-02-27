#!/bin/bash

FILES=$(find . -regex ".*\(mg-\).*\.\(sh\|py\)")

for FILE in $FILES; do
  DIR=$(dirname $FILE)
  BASE=$(basename $FILE)
  NEW=$(echo ${BASE} | cut -b 4-)

  echo "Old: ${BASE} | New: ${NEW}"
  git mv $FILE ${DIR}/mg-${BASE}
done


