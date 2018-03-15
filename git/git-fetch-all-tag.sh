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
	echo -e "${RED}Fetching ${BASE}...${NC}"

	cd $DIR
	git fetch --all --tag

  BRANCH_NAME=$(git symbolic-ref --short HEAD 2>/dev/null)

  # for git prior to 1.7
  # ahead=$(git rev-list origin/${branch_name}..HEAD | wc -l)
  AHEAD=$(git rev-list "${BRANCH_NAME}"@{upstream}..HEAD 2>/dev/null | wc -l)
  echo -e "${GREEN}Ahead = ${AHEAD// /}${NC}"

  # for git prior to 1.7
  # behind=$(git rev-list HEAD..origin/${branch_name} | wc -l)
  BEHIND=$(git rev-list HEAD.."${BRANCH_NAME}"@{upstream} 2>/dev/null | wc -l)
  echo -e "${BLUE}Behind = ${BEHIND// /}${NC}"

  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' && \
        -n $(git status ${FLAGS} | grep -E '^\?\?' 2> /dev/null | tail -n1) ]]; then
		echo -e "${LIGHT_RED}There are some changes. Leaving the repository.${NC}"
	else
		echo -e "${LIGHT_GREEN}There are no changes. Pulling the repository.${NC}"
		git pull
  fi
	echo -e "${LIGHT_BLUE}-------------------------------------------------------------------------------------------${NC}"

done

