#!/usr/bin/env bash

#set -euo pipefail
#if [[ $TRAVIS = "true" ]]; then
#    echo "yes running on travis"
#else
#    echo "no travis"
#fi

#sleep 1000
docker run -dit -v /var/run/docker.sock:/var/run/docker.sock --name pusher ubuntu:16.04
docker cp test-travis.sh pusher:/
docker exec -it pusher /bin/bash -c "./test-travis.sh"
exit 1

if [ -d "${SUBPROJECT}" -a -f "${SUBPROJECT}/build.sh" ]; then
    ${SUBPROJECT}/build.sh
elif [ -f "build.sbt" ]; then
    echo "build.sbt"
else
    echo "No build/test files found!"
    exit 1
fi
