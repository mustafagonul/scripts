#!/bin/bash

INSTALL_DIR=${HOME}/.local/bin

# Create install directory
mkdir -p ${INSTALL_DIR}

# Uninstall links
source ./uninstall.sh

# Looping directories
for DIR in *; do
	if [[ ! -d ${DIR} ]]; then
		continue
	fi

	echo "Directory: ${DIR}"

	FILES=$(find ${DIR} -regex ".*\.\(sh\|py\)")

	for FILE in ${FILES}; do
		if [[ -d ${FILE} ]]; then
			continue
		fi

		TARGET=$(pwd)/${FILE}
		BASE=$(basename ${FILE})
		LINK_NAME=${INSTALL_DIR}/mg-${BASE}

		echo "Creating link : ${FILE} -> ${LINK_NAME}"

    ln -s -T ${TARGET} ${LINK_NAME}
	done
done


