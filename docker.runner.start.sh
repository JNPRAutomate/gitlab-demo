#! /bin/bash

random_id=`echo $(( RANDOM % (1000) + 5 ))`

# Collect Gitlab token
registration_token=`docker run --rm -t \
            		--env GITLAB_URL="http://gitlab:9090/" \
            		--env GITLAB_USERNAME="root" \
            		--env GITLAB_PASSWORD="Juniper1" \
            		--link "gitlab:gitlab" \
            		-i dgarros/gitlab-getcitoken`

echo "Registration token is: $registration_token"

# Start runner
docker run -d \
        --name gitlab-runner-$random_id \
  			-v /var/run/docker.sock:/var/run/docker.sock \
				--link gitlab:gitlab \
  		  gitlab/gitlab-runner:alpine

# Register Runner
docker exec -it gitlab-runner-$random_id \
    gitlab-runner register \
    --non-interactive \
    --url "http://gitlab:9090/ci"\
    --executor "docker" \
    --name "runner-docker-$random_id" \
    --docker-links "gitlab:gitlab" \
    --tag-list "docker" \
    --docker-image "ruby:2.1" \
    --registration-token "$registration_token"

echo "Registered Runner: runner-docker-$random_id (in container:gitlab-runner-$random_id) "
# https://gitlab.com/gitlab-org/gitlab-ci-multi-runner/blob/master/docs/install/docker.md
