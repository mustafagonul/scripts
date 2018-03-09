#!/bin/bash

# Reference:
# https://stackoverflow.com/questions/2507766/merge-convert-multiple-pdf-files-into-one-pdf

FILES=$(find . -name "*.pdf")

if [[ -z "$FILES" ]]; then
	echo "There is no pdf file!"
	exit 1
fi

echo "Merging pdf files..."
pdftk $FILES cat output output.pdf

echo "Done!"

