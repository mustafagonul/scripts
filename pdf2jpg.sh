#!/bin/bash

# $1 pdf file
# $2 directory

mkdir $2


page_count=$(pdfinfo ${1} | grep Pages | awk '{print $2}')


for (( p=1; p<=${page_count}; p++ ))
do
   echo "PAGE ${p}"
   convert               \
      -limit memory 64   \
      -limit map 64      \
      -verbose           \
      -density 600       \
      -trim              \
      -quality 100       \
      -flatten           \
      -sharpen 0x1.0     \
      "$1[${p}]"      \
      ${2}/page_${p}.jpg
done
