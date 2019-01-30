#!/bin/bash

GITDIR=${HOME}/git/MG
GIT_PRECOMMIT=.git/hooks/pre-commit
GIT_PRECOMMIT_TEMPLATE=${HOME}/.git/templates/hooks/pre-commit


RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
LIGHT_RED='\e[1;31m'
LIGHT_BLUE='\033[1;34m'
LIGHT_GREEN='\033[1;32m'
NC='\033[0m' # No Color


# Check for the pre-commit file
# If there is no pre-commit file there is no need to run the script
if [[ ! -f $GIT_PRECOMMIT_TEMPLATE ]] ; then
  echo -e "${LIGHT_RED}There is no ${GIT_PRECOMMIT_TEMPLATE} file!${NC}"
  exit 0
fi

for DIR in ${GITDIR}/* ; do
  echo -e "${LIGHT_BLUE}-------------------------------------------------------------------------------------------${NC}"
  BASE=$(basename ${DIR})
  echo -e "${RED}Processing ${BASE}...${NC}"

  cd $DIR

  # Check for the .git directory
  if [[ ! -d .git ]]; then
    echo -e "${LIGHT_RED}${BASE} is not a repository!${NC}"
    continue
  fi

  if [[ -f ${GIT_PRECOMMIT} ]] ; then
    echo -e "${LIGHT_RED}There is pre-commit file in the repository!${NC}"
    continue
  fi

  # Copy operation
  cp $GIT_PRECOMMIT_TEMPLATE $GIT_PRECOMMIT

  # Checking the file
  if [[ -f ${GIT_PRECOMMIT} ]] ; then
    echo -e "${LIGHT_GREEN}Pre-commit file copied successfully.${NC}"
    continue
  else
    echo -e "${LIGHT_RED}No pre-commit file in the repository!${NC}"
  fi

  echo -e "${LIGHT_BLUE}-------------------------------------------------------------------------------------------${NC}"
done


