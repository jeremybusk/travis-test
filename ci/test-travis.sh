#!/usr/bin/env bash
set -exo pipefail
#set -v
echo "running in script"

# if [[ $TRAVIS = "true" ]]; then
#     echo "yes running on travis"
# else
#     echo "no travis"
# fi
# echo "finished travis test"
# exit 1

if [ "${TRAVIS}" = "false" ]; then
    echo "is travis"
    #docker_user="$DOCKER_USERNAME" 
    #docker_pass="$DOCKER_PASSWORD" 
    #docker login -u "${docker_user}" -p "${docker_pass}"  > /dev/null 2>&1
    docker login -u "${DOCKER_USERNAME}" -p "${DOCKER_PASSWORD}"
    echo "docker login worked"
    #docker tag  ${docker_src_repo}:${docker_src_tag} ${docker_dst_repo}
    #docker push ${docker_dst_repo}
else
    # docker login
    echo "not travis"
    #docker tag  ${docker_src_repo}:${docker_src_tag} ${docker_dst_repo}
    #docker push ${docker_dst_repo}
fi
echo "finished running script"
exit 1
