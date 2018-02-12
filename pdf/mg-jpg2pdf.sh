#!/bin/bash

print_help () {
  echo "jpg2pdf.sh --directory | -d <DIRECTORY> --pattern | -p <PATTERN> --name | -n <NAME> --row | -r <ROW> --col | -c <COL>"
  echo "jpg2pdf.sh --help | -h"
  exit
}

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -d|--directory)
    DIRECTORY="$2"
    shift # past argument
    shift # past value
    ;;

    -p|--pattern)
    PATTERN="$2"
    shift # past argument
    shift # past value
    ;;

    -n|--name)
    NAME="$2"
    shift # past argument
    shift # past value
    ;;

    -r|--row)
    ROW="$2"
    shift # past argument
    shift # past value
    ;;

    -c|--col)
    COL="$2"
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


if [[ -z $DIRECTORY ]]; then
    print_help
fi

if [[ -z $PATTERN ]]; then
    print_help
fi

if [[ -z $NAME ]]; then
    print_help
fi


re='^[0-9]+$'

if ! [[ $ROW =~ $re ]] ; then
   print_help
fi

if ! [[ $COL =~ $re ]] ; then
   print_help
fi

FILES=$(ls -v $DIRECTORY/$PATTERN)
TEMP_FILE=$(mktemp $DIRECTORY/XXXXXXXXX.pdf)

montage $FILES -tile ${COL}x${ROW} -geometry 1000 $TEMP_FILE
pdftk $TEMP_FILE output $DIRECTORY/$NAME.pdf compress

rm -f $TEMP_FILE



