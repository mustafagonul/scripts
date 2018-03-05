#!/bin/bash

INSTALL_DIR=${HOME}/.local/bin

# Remove current links
FILES=$(find ${INSTALL_DIR} -regex ".*\(mg-\).*\.\(sh\|py\)")

for FILE in ${FILES}; do
	if [[ -L ${FILE} ]]; then
		echo "Deleting ${FILE}."
		rm -f ${FILE}
	fi
done


