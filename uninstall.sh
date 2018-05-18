#!/bin/bash

. ./base.sh

# Remove current links
FILES=$(find ${INSTALL_DIR} -regex ".*\(${INSTALL_PREFIX}-\).*\.\(sh\|py\)")

for FILE in ${FILES}; do
	if [[ -L ${FILE} ]]; then
		echo -e "${BLUE}Deleting ${RED}${FILE}${NC}"
		rm -f ${FILE}
	fi
done


