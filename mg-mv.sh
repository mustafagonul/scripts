#!/bin/bash

FILES=$(find . -regex ".*\.\(sh\|py\)")

for FILE in $FILES; do
  DIR=$(dirname $FILE)
  BASE=$(basename $FILE)

  git mv $FILE ${DIR}/mg-${BASE}
done


