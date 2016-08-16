# gitlab-demo
Gitlab and Gitlab CI demo, packaged with Docker

# How to deploy Gitlab and Gitlab-CI
## Launch the Gitlab server

You can launch the main container using the following script
```
./docker.start.sh
```
> This container is big and all services can take up to 10 min to Start

#### Verification
At the end of the boot, you should be able to access the **management interface on port 9090**
> Assuming your are running it on your local server/laptop the URL is http://localhost:9090/

## Launch a Gitlab CI Runner

Once the main container is running you can start a Gitlab CI runner in another container.  
This component is essential if you want to try Gitlab-CI
```
./docker.runner.start.sh
```

#### Verification

The output should be similar to that
```
gitlab-demo ./docker.runner.start.sh
Registration token is: 8WCLm6EhjKjxLtxH5Ew1
1da38798fdc347469fc0adb968106439d1ffff433a868001cc20fa8c0a19250b
Running in system-mode.

Registering runner... succeeded                     runner=8WCLm6Eh
Runner registered successfully. Feel free to start it, but if it's running already the config should be automatically reloaded!
Registered Runner: runner-docker-665
```

If you connect to the runners adminstration URL you should see one runner listed at the bottom of the page
> Assuming your are running it on your local server/laptop the URL is http://localhost:9090/admin/runners

# Experiment with Gitlab and Gitlab-CI

To Experiment with Gitlab and Gitlab-CI you can import the follwing project
```
https://github.com/JNPRautomate/ansible-junos-evpn-vxlan
```

It already include a the necessary [instructions for Gitlab_CI](https://github.com/JNPRAutomate/ansible-junos-evpn-vxlan/blob/master/.gitlab-ci.yml)
