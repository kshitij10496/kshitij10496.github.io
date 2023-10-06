---
title: "Patching Go Modules"
date: 2023-07-26T22:24:51+02:00
draft: false

slug: "patching-go-modules" 
tags: ["go", "dependencies"]
categories: ["software", "journal"]
---

When I was searching for ways to write integation tests in a project, I discovered Test Containers project. I decided to give it a shot and learnt more about the project.
Thanks to the wonderful `testcontainers/testcontainers-go`[^1] package, it was relatively straightforward to bootstrap the setup into my project - code, tests, and CI. I was pretty happy about the entire experience. Maybe I will share the setup here sometime in the future.

Unfortunately, the CI pipeline broke out of the blue on the morning July 12 2023.
When I checked the logs, it was clear that something funny is going on with test containers.
```http: invalid Host header, host port waiting failed: could not start container: creating reaper failed: failed to create container```

After further investigation, I discovered that the crux of the issue originated from a security patch on the Go project with Go v1.20.6 release. This change cascaded to the `docker` client package, used by `testconatiners-go` pacakge.
Fortunately, the docker/moby project quickly fixed it and issued a new release.[^2]
However, I had to wait for the `testcontainers-go` project to update their dependencies.[^3]

Meanwhile, I came to know that we can pin the "indirect" dependencies in Go Modules.
This effectively meant that I could resolve the issue on my project, without needing a fix from `testcontainers-go` project. It was as simple as:
```sh
go get github.com/docker/docker@v24.0.5
```
This discovery that we can update indirect dependencies in our modules, independently of the direct dependency. I'm not sure whether this clarifies the concept of modules for me or confuses me even further. But it is what it is. If somebody is willing to share why/how this works, I will be extremely grateful.

Everyday I am amazed by the wonderful OSS community that collaborates, and contributes so much to the wellbeing of the systems we build. It's just a marvellous feat of the anthropocene era.

[^1]: https://github.com/testcontainers/testcontainers-go
[^2]: https://github.com/moby/moby/releases/tag/v24.0.5
[^3]: https://github.com/testcontainers/testcontainers-go/pull/1361