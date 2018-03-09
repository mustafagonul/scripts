#!/bin/bash

GITDIR=$HOME/git/MG

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

for DIR in ${GITDIR}/* ; do
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


done

