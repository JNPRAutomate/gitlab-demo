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

## 1 - Create the project
- Create a new project [http://localhost:9090/projects/new](http://localhost:9090/projects/new)
- Name your project **test-gitlab** in `project name`
- Choose "Git Repo by URL"
- Copy the URL of the project in `Git repository URL`
- Validate with `create project` button
> the name of the project is important because it will be used in all following URL
> If you decide to use another name, please keep in mind that you'll need to change all URL

## 2 - Create a new branch: feature1 and change a file
- Create a new branch - [http://localhost:9090/root/test-gitlab/branches/new](http://localhost:9090/root/test-gitlab/branches/new)
- Name the branch **feature** in `Branch Name`

- Edit the file `README.md` here http://localhost:9090/root/test-gitlab/edit/feature1/README.md
- Save the change by doing a commit on Branch `feature1` (default option)

## 3 - Verify that tests are running for the new change
At this point, Gitlab will start a Build/Test process for this new Branch
You can check its progress here : [http://localhost:9090/root/test-gitlab/pipelines](http://localhost:9090/root/test-gitlab/pipelines)
> Because we are not in the branch Master, only `check_playbooks` will be executed

## 4 - Create a new Merge Request to incorporate the changes in the Branch master
- open a merge request : http://localhost:9090/root/test-gitlab/merge_requests/new
 - Source Branch is: `feature1`
 - Target Branch is: `master`

Once the Merge request has been created you should already see the result of the last Build on the merge request page
`CI build passed for XX`

## 5 - Verify that both TEST and DEPLOY stages are executed for the branch master
Once the new code has been migrated into the branch master, a new build is triggered and this time both TEST and DEPLOY Stage will be executed.
