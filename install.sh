#!/bin/bash

. ./base.sh

# Create install directory
mkdir -p ${INSTALL_DIR}

# Uninstall links
. ./uninstall.sh

# Looping directories
for DIR in *; do
	if [[ ! -d ${DIR} ]]; then
		continue
	fi

	echo -e "${LIGHT_BLUE}Directory: ${LIGHT_RED}${DIR}${NC}"

	FILES=$(find ${DIR} -regex ".*\.\(sh\|py\)")

	for FILE in ${FILES}; do
		if [[ -d ${FILE} ]]; then
			continue
		fi

		TARGET=$(pwd)/${FILE}
		BASE=$(basename ${FILE})
		LINK_NAME=${INSTALL_DIR}/mg-${BASE}

		echo -e "${BLUE}Creating link : ${GREEN}${FILE}${NC} -> ${RED}${LINK_NAME}${NC}"

    ln -s -T ${TARGET} ${LINK_NAME}
	done
done


