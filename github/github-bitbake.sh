#!/bin/bash

## Debug
# set -x

## Variables
GITHUB_DIR=$HOME/git/GITHUB
BITBAKE_DIR=$GITHUB_DIR/bitbake

## Removes if the directory exists
if [[ -d $BITBAKE_DIR ]]; then
  rm -Rf $BITBAKE_DIR
fi

## Cloning bitbake
pushd $GITHUB_DIR
git clone https://github.com/openembedded/bitbake.git

## Checking out 1.8.19
pushd bitbake
git checkout 1.8.19

## Go back
popd
popd

