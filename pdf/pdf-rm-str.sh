#!/bin/bash

print_help () {
  echo "pdf_str_remove.sh --file | -f <file> --string | -s <string>"
  echo "pdf_str_remove.sh --help | -h"
  exit
}

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -f|--file)
    FILE="$2"
    shift # past argument
    shift # past value
    ;;
    -s|--string)
    STRING="$2"
    shift # past argument
    shift # past value
    ;;
    -h|--help)
    print_help
    ;;
    *)    # unknown option
    print_help
    ;;
esac
done

if [[ -z $FILE ]]; then
    print_help
fi

if [[ -z $STRING ]]; then
    print_help
fi

NEW_FILE=${FILE}.new
TEMP_UNC_FILE=$(mktemp ./XXXXXXXXX)
TEMP_MOD_FILE=$(mktemp ./XXXXXXXXX)

pdftk $FILE output $TEMP_UNC_FILE uncompress

sed "s/$STRING//g" < $TEMP_UNC_FILE > $TEMP_MOD_FILE

pdftk $TEMP_MOD_FILE output $NEW_FILE compress

rm -f $TEMP_UNC_FILE
rm -f $TEMP_MOD_FILE

exit
