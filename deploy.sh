#!/bin/bash
set -e
# Description: Deploy

LIB_DIR=$(readlink -ev ./lib)

SCRIPTS_DIR=${HOME}/bash-scripts
mkdir -p "${SCRIPTS_DIR}"
SCRIPTS_DIR=$(readlink -ev "${SCRIPTS_DIR}")

yes | cp -a ${LIB_DIR}/* "${SCRIPTS_DIR}"

while IFS='' read -r LINE || [[ -n "${LINE}" ]]; do
  echo "source \"${LINE}\"" >> ${HOME}/.bashrc
done < <( find "${SCRIPTS_DIR}" -type f -name '*.sh')

echo "Run: source ${HOME}/.bashrc"