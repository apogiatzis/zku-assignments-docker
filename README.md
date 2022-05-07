# Docker Environment for ZKU Assignments

This repo contians Dockerfiles that define images for completing ZKU assignments. The aim of this project is to alleviate the pain of setting up dependencies in cross platform environments which very often results into issues that are dependend on the host environment.


## Summary

The dependencies installed in this environment are:
- NodeJS v16.0.0
- circom (latest)
- cargo (latest stable)

## Get Started

There are two possible ways of utilizing the Dockerfiles in this repository to launch an isolated environments with all the required dependencies pre-installed:

1. Run locally using Docker engine
2. Run on Gitpod


### Run locally using Docker engine

In order to run locally, it is necessary that you already have Docker engine installed on your machine.

You can **optionally** rebuild the image in case of custom modifications or requirements in the [Dockerfile](./Dockerfile). Otherwise this is not a necessary step as the image has already been built and pushed to Github's container registry. You can build the image locally using the following command:

```bash
docker build . <image-name>
```

In order to run a container using the locally built image, ensure that the image name is replaced to the one used at the build stage. For instance:
```bash
docker build . my-zku-assignments-image
docker run -it --rm -v $(pwd):/home/student/workspace  my-zku-assignments-image 
```


### Run on Gitpod

Alternatively, Gitpod environmet builds on top of the `gitpod/workspace-base` image. To launch gitpod with this docker workspace click the button below:

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/apogiatzis/zku-assignments-docker)