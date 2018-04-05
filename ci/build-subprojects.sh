#!/usr/bin/env bash

#set -euo pipefail
#if [[ $TRAVIS = "true" ]]; then
#    echo "yes running on travis"
#else
#    echo "no travis"
#fi

sleep 1000

if [ -d "${SUBPROJECT}" -a -f "${SUBPROJECT}/build.sh" ]; then
    ${SUBPROJECT}/build.sh
elif [ -f "build.sbt" ]; then
    echo "build.sbt"
else
    echo "No build/test files found!"
    exit 1
fi
