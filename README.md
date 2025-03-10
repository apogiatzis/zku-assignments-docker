# Docker Environment for ZKU Assignments

This repo contians Dockerfiles that define images for completing ZKU assignments. The aim of this project is to alleviate the pain of setting up dependencies in cross platform environments which very often results into issues that are dependend on the host environment.


## Summary

The dependencies installed in this environment are:
- NodeJS v16.0.0
- circom (latest)
- cargo (latest stable)
- yarn
- circom_tester
- snarkjs

This workspace comes only with the required dependencies for the assigments. The assignments themselves need to be cloned from the official ZKU repo.

**WARNING:** The provided command to launch the workspace container here mounts your current working directory to `/home/student/workspace` therefore everything stored in there will be persistent on your disk even after the container terminates. **Any work saved on any other directory will be lost (due to the `--rm` flag)!** You can change the mounted directory by modifying the -v option in the `docker run ...` command.

## Get Started

There are two possible ways of utilizing the Dockerfiles in this repository to launch an isolated environments with all the required dependencies pre-installed:

1. Run locally using Docker engine
2. Run on Gitpod


### Run locally using Docker engine

In order to run locally, it is necessary that you already have Docker engine installed on your machine.

Launch environment using the prebuilt image:
```bash
docker run -it --rm -v $(pwd):/home/student/workspace ghcr.io/apogiatzis/zku-assignment-workspace:latest
```

Note that If you have already launched the container locally using the prebuilt image, the above command will use the image downloaded at that time. To make sure that you have the latest image run:
```
docker pull ghcr.io/apogiatzis/zku-assignment-workspace:latest
```

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

Alternatively, Gitpod environmet builds on top of the `gitpod/workspace-base` image. Gitpod provides a full fledged completely online IDE experience with a dedicated workspace. It is a great alternative if you don't want to install anything on your machine.

Note that running this in Gitpod requires authenticating using your Github account

To launch gitpod with this docker workspace click the button below:

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/apogiatzis/zku-assignments-docker)

#### 🌏  Alternative Cloud Development Environments:

Click any of the buttons below to start a new development environment to demo or contribute to the codebase without having to install anything on your machine:

[![Open in VS Code](https://img.shields.io/badge/Open%20in-VS%20Code-blue?logo=visualstudiocode)](https://vscode.dev/github/apogiatzis/zku-assignments-docker)
[![Open in Glitch](https://img.shields.io/badge/Open%20in-Glitch-blue?logo=glitch)](https://glitch.com/edit/#!/import/github/apogiatzis/zku-assignments-docker)
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/apogiatzis/zku-assignments-docker)
[![Open in StackBlitz](https://developer.stackblitz.com/img/open_in_stackblitz.svg)](https://stackblitz.com/github/apogiatzis/zku-assignments-docker)
[![Edit in Codesandbox](https://codesandbox.io/static/img/play-codesandbox.svg)](https://codesandbox.io/s/github/apogiatzis/zku-assignments-docker)
[![Open in Repl.it](https://replit.com/badge/github/withastro/astro)](https://replit.com/github/apogiatzis/zku-assignments-docker)
[![Open in Codeanywhere](https://codeanywhere.com/img/open-in-codeanywhere-btn.svg)](https://app.codeanywhere.com/#https://github.com/apogiatzis/zku-assignments-docker)
