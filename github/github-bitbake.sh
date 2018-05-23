#!/bin/bash

set -x

GITHUB_DIR=$HOME/git/GITHUB
BITBAKE_DIR=$GITHUB_DIR/bitbake


if [[ ! -d $BITBAKE_DIR ]]; then

  pushd $GITHUB_DIR

  git clone https://github.com/openembedded/bitbake/tree/master
  git checkout 1.8.19

  popd

fi
