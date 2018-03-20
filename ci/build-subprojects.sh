#! /usr/bin/env bash

set -euo pipefail

if [ -d "${SUBPROJECT}" -f "${SUBPROJECT}/build.sh" ]; then
    ${SUBPROJECT}/build.sh
elif [ -f "build.sbt" ]; then
    echo "build.sbt"
else
    echo "No build/test files found!"
    exit 1
fi
