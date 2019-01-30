#!/bin/bash

GITDIR=$HOME/git/MG
SSH_CONFIG=${HOME}/.ssh/config


RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
LIGHT_RED='\e[1;31m'
LIGHT_BLUE='\033[1;34m'
LIGHT_GREEN='\033[1;32m'
NC='\033[0m' # No Color


# Check for the ssh config file
# if there is no config file there is no need to change the remotes
if [[ ! -f $SSH_CONFIG ]] ; then
  echo -e "${LIGHT_RED}There is no ${SSH_CONFIG} file!${NC}"
  exit 0
fi

# Check inside the ssh config file
# if there is no "me.github.com" inside the ssh config file there
# is no need to change the remotes
if ! grep -q "me\.github\.com" $SSH_CONFIG ; then
  echo -e "${LIGHT_RED}There is no \"me.github.com\" in the ${SSH_CONFIG} file!${NC}"
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
  
  OLD_REMOTE=$(git remote get-url origin)
  NEW_REMOTE=$(echo ${OLD_REMOTE} | sed 's/\@github.com/\@me.github.com/g')
  
  echo -e "${BLUE}Old Remote: ${OLD_REMOTE}${NC}"
  echo -e "${GREEN}New Remote: ${NEW_REMOTE}${NC}"

  if [[ "$OLD_REMOTE" == "$NEW_REMOTE" ]] ; then
    echo -e "${LIGHT_RED}Old remote and new are same!${NC}"
  else
    git remote set-url origin $NEW_REMOTE

    echo -e "${LIGHT_GREEN}Remote changed!${NC}"
  fi

  echo -e "${LIGHT_BLUE}-------------------------------------------------------------------------------------------${NC}"
done

