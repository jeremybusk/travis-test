#!/usr/bin/env bash

set -euo pipefail

if [ -d "${SUBPROJECT}" -a -f "${SUBPROJECT}/build.sh" ]; then
    #echo "${SUBPROJECT}/build.sh"
    ${SUBPROJECT}/build.sh
    # (cd "${SUBPROJECT}"; bash ./build.sh)
elif [ -f "build.sbt" ]; then
    echo "build.sbt"
else
    echo "No build/test files found!"
    exit 1
fi
