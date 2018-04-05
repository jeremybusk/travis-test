#!/usr/bin/env bash




if [ -d "${SUBPROJECT}" -a -f "${SUBPROJECT}/build.sh" ]; then
    # ${SUBPROJECT}/build.sh
    echo "start"
    # docker run -dit -v /var/run/docker.sock:/var/run/docker.sock --name pusher ubuntu:16.04
    docker run -dit --name pusher ubuntu:16.04
    docker cp test-travis.sh pusher:/
    docker exec -it pusher /bin/bash -c "./test-travis.sh"
# exit 1
elif [ -f "build.sbt" ]; then
    echo "build.sbt"
else
    echo "No build/test files found!"
    exit 1
fi
