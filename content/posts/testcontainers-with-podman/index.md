---
title: "Testcontainers with Podman"
date: 2023-11-20T15:48:41+01:00
draft: false

slug: "testcontainers-with-podman" 
tags: ["testcontainers", "podman", "testing"]
---

I use [Testcontainers](https://testcontainers.com/) for writing integration tests for my APIs.  
In particular, the tests concerning DBs - migrations, SQL queries.

Currently, I replacing [Docker](https://www.docker.com/) with [Podman]() as the preferred tool for managing [Containers](https://developers.redhat.com/blog/2018/02/22/container-terminology-practical-introduction#container).

Eventually, I stumbled upon the problem of configuring Testcontainers with Podman on my local machine.
Here is what I discovered during the process of migration from Docker to Podman, with respect to Testcontainers:

## Problem

Testcontainers implicitly use Docker as the default container runtime.
Thus, the library acts as a Docker API client.

## Solution

1. We do not need to make any changes on the application code layer.
2. We need to set the following 2 envvars in order to seamless switch from Docker to Podmangit:

```sh
# only for rootless Podman.
$ export TESTCONTAINERS_RYUK_DISABLED=true 

# configure Docker API clients to use Podman for running containers.
$ export DOCKER_HOST=unix://$(podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}') 
```

Voila!

## References

- [Testconatiners - General Container Runtime Requirements](https://java.testcontainers.org/supported_docker_environment/#podman)
- [Testcontainers - Using Podman instead of Docker](https://golang.testcontainers.org/system_requirements/using_podman/)
