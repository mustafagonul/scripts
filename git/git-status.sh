#!/bin/bash

GITDIR=$HOME/git/MG


RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
LIGHT_RED='\e[1;31m'
LIGHT_BLUE='\033[1;34m'
LIGHT_GREEN='\033[1;32m'
NC='\033[0m' # No Color


for DIR in ${GITDIR}/* ; do
  echo -e "${LIGHT_BLUE}-------------------------------------------------------------------------------------------${NC}"
  BASE=$(basename ${DIR})
  echo -e "${RED}Status of ${BASE}...${NC}"

  cd $DIR

  # Check for the .git directory
  if [[ ! -d .git ]]; then
    echo -e "${LIGHT_RED}${BASE} is not a repository!${NC}"
    continue
  fi

  BRANCH_NAME=$(git symbolic-ref --short HEAD 2>/dev/null)

  # for git prior to 1.7
  # ahead=$(git rev-list origin/${branch_name}..HEAD | wc -l)
  AHEAD=$(git rev-list "${BRANCH_NAME}"@{upstream}..HEAD 2>/dev/null | wc -l)
  echo -e "${GREEN}Ahead = ${AHEAD// /}${NC}"

  # for git prior to 1.7
  # behind=$(git rev-list HEAD..origin/${branch_name} | wc -l)
  BEHIND=$(git rev-list HEAD.."${BRANCH_NAME}"@{upstream} 2>/dev/null | wc -l)
  echo -e "${BLUE}Behind = ${BEHIND// /}${NC}"

  mod=0

  # Check for modified files
  if [[ ! -z "$(git status --untracked-files=no --porcelain)" ]]; then 
    mod=1
    echo -e "${LIGHT_RED}There are some modified files.${NC}"
  fi

  # Check for untracked files
  if [[ $mod -eq 0 ]] && [[ ! -z "$(git status --porcelain)" ]]; then  
    mod=1
    echo -e "${LIGHT_RED}There are some untracked files.${NC}"
  fi

  # Check if everything is peachy keen
  if [ $mod -eq 0 ]
  then
    echo -e "${LIGHT_GREEN}There are no changes.${NC}"
  fi

  echo -e "${LIGHT_BLUE}-------------------------------------------------------------------------------------------${NC}"

done

