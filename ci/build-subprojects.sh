#!/usr/bin/env bash
set -exo pipefail



if [ -d "${SUBPROJECT}" -a -f "${SUBPROJECT}/build.sh" ]; then
    # ${SUBPROJECT}/build.sh
    echo "start"
    # docker run -dit -v /var/run/docker.sock:/var/run/docker.sock --name pusher ubuntu:16.04
    cd ci/
    echo "=========="
    echo ${CI}
    echo ${TRAVIS}
    echo ${DOCKER_USERNAME}
    echo "=========="
#docker rm -f aaaaaaa-pusher
#docker run -dit -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_USERNAME="${DOCKER_USERNAME}" -e DOCKER_PASSWORD="${DOCKER_PASSWORD}" -e TRAVIS="${TRAVIS}" --name pusher ubuntu:16.04
#docker run -dit -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_USERNAME="${DOCKER_USERNAME}" -e DOCKER_PASSWORD="${DOCKER_PASSWORD}" -e TRAVIS="${TRAVIS}" -e fthis="fthisvalue" -e JTEST="${JTEST}" --name pusher ubuntu:16.04
#docker run -dit -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_USERNAME="${DOCKER_USERNAME}" -e DOCKER_PASSWORD="${DOCKER_PASSWORD}" -e TRAVIS="${TRAVIS}" -e fthis="fthisvalue" -e JTEST="${JTEST}" --name pusher ubuntu:16.04
docker run -dit -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_USERNAME -e DOCKER_PASSWORD="${DOCKER_PASSWORD}" -e TRAVIS -e fthis="fthisvalue" -e JTEST="${JTEST}" --name pusher ubuntu:16.04
#docker run -dit -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_USERNAME DOCKER_PASSWORD -e TRAVIS -e fthis="fthisvariablevalue" --name pusher ubuntu:16.04
    #docker run -dit --name pusher ubuntu:16.04
    docker cp test-travis.sh pusher:/
    docker exec -it pusher /bin/bash -c "./test-travis.sh"
# exit 1
elif [ -f "build.sbt" ]; then
    echo "build.sbt"
else
    echo "No build/test files found!"
    exit 1
fi
