## [Part 3](https://devopswithdocker.com/part3/)

### 3.1

For the frontend project the new Dockerfile is located 
[here](/Part3/3.1/Dockerfile.frontend) and the old [here](/Part1/1.12/Dockerfile.frontend)

Build and inspect the image size before improvements, which is around `516 MB`

`$ docker build -t ex_3.1_front_old -f ../../Part1/1.12/Dockerfile.frontend .`

`$ docker image inspect ex_3.1_front_old --format='{{.Size}}'`

![screenshot](Part3/3.1/img/3.1_size_front_old.png)

Build and inspect the image size after improvements, which is around `487 MB`

`$ docker build -t ex_3.1_front_new -f Dockerfile.frontend .`

`$ docker image inspect ex_3.1_front_new --format='{{.Size}}'`

![screenshot](Part3/3.1/img/3.1_size_front_new.png)

We reduced the image size for around `29 MB` by removing apt-source lists, and curl.

For the backend project the new Dockerfile is located 
[here](/Part3/3.1/Dockerfile.backend) and the old [here](/Part1/1.12/Dockerfile.backend)

Build and inspect the image size before improvements, which is around `336 MB`.

`$ docker build -t ex_3.1_back_old -f ../../Part1/1.12/Dockerfile.backend .`

`$ docker image inspect ex_3.1_back_old --format='{{.Size}}'`

![screenshot](Part3/3.1/img/3.1_size_back_old.png)

Build and inspect the image size after improvements, which is around `307 MB`.

`$ docker build -t ex_3.1_back_new -f Dockerfile.backend .`

`$ docker image inspect ex_3.1_back_new --format='{{.Size}}'`

![screenshot](Part3/3.1/img/3.1_size_back_new.png)

We reduced the image size for around `29 MB` by removing apt-source lists and curl.

### 3.2

We choose to use Github Actions instead of CircleCI to create a deployment pipeline to Heroku.

A new `workflow.yml` file added that describes the action, the jobs and the steps that is located [here](.github/workflows/workflow.yml)

The action is triggered only after a push occurs on master branch and the `Part3/3.2` directory.

You can find the deployed app [here](https://chanioxaris-mooc-workflow.herokuapp.com/)

### 3.3

The Dockerfile is located [here](Part3/3.3/Dockerfile)

The script is located [here](Part3/3.3/buildService.sh)

Build a new image from our Dockerfile 

`$ docker build -t ex_3.3 .`

Create a new container from `ex_3.3` image in interactive mode with bash session and mount host machine's docker 
socket into the container.

`$ docker run -it -v /var/run/docker.sock:/var/run/docker.sock ex_3.3 bash`

Fill any required information (docker hub username/password, image tag and github repo url) to start the build service.

![screenshot](Part3/3.3/img/3.3_run.jpg)

You can find the new image published in your docker hub repository.

### 3.4

The Dockerfile for the frontend project is located [here](Part3/3.4/Dockerfile.frontend)

The Dockerfile for the backend project is located [here](Part3/3.4/Dockerfile.backend)

### 3.5 

The Dockerfile for the frontend project is located [here](Part3/3.5/Dockerfile.frontend)

If we use the `ubuntu:16:04` as the base image, image size would be around `487 MB`

After we use the `node:alpine` as the base image, the new image size would be around `327 MB`

![screenshot](Part3/3.5/img/3.5_size_front.png)

We reduced the image size for around `160 MB` by using a different base image.

The Dockerfile for the backend project is located [here](Part3/3.5/Dockerfile.backend)

If we use the `ubuntu:16:04` as the base image, image size would be around `307 MB`

After we use the `node:alpine` as the base image, the new image size would be around `147 MB`

![screenshot](Part3/3.5/img/3.5_size_back.png)

We reduced the image size for around `160 MB` by using a different base image.

### 3.6

The Dockerfile is located [here](Part3/3.6/Dockerfile)

With the use of a multi-stage build we reduced our image size down to `124 MB` from `327 MB`,
gaining a total of `203 MB`

![screenshot](Part3/3.6/img/3.6_size.png)

### 3.7

I will use my [golang-example-project](/Part1/1.15/golang-example-project) build for exercise 1.15 as reference.

The new Dockerfile is located [here](/Part3/3.7/Dockerfile) and the old [here](/Part1/1.15/Dockerfile)

Before any improvements the image has a size of `817 MB`

![screenshot](Part3/3.7/img/3.7_size_old.png)

After all the improvements (alpine images, multi-stage build, non-route user) the new image is `11 MB`

![screenshot](Part3/3.7/img/3.7_size_new.png)

We reduced the image size by `806 MB`
