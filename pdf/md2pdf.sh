#!/bin/bash

for filename in *.md
do
  basename=${filename%.*}
  pdfname=${basename}.pdf
  pandoc -s -o $pdfname $filename
done

