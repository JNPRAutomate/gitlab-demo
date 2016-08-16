#! /bin/bash

docker rm /gitlab

docker run --detach \
		--hostname gitlab.example.com \
		--publish 9090:9090 \
   	--name gitlab \
		--env GITLAB_OMNIBUS_CONFIG="external_url 'http://gitlab:9090/';" \
    --env  GITLAB_ROOT_PASSWORD="Juniper1" \
 		gitlab/gitlab-ce:8.10.5-ce.0

# --volume $(pwd)/data/postgresql:/var/opt/gitlab/postgresql \
# --volume $(pwd)/config:/etc/gitlab \
# 		-e GITLAB_ROOT_PASSWORD="Juniper" \
# 		--volume $(pwd)/config:/etc/gitlab \
