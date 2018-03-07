#!/bin/bash

GITDIR=$HOME/git/MG

for DIR in ${GITDIR}/* ; do
	BASE=$(basename ${DIR})
	echo "Fetching $BASE..."

	cd $DIR
	git fetch --all --tag

done

