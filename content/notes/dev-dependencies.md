---
title: "Dev Dependencies"
date: 2024-01-25T12:19:24+01:00
draft: false

ref: "https://rednafi.com/go/omit_dev_dependencies_in_binaries/"
slug: "dev-dependencies" 
tags: ["go"]
categories: ["notes"]
---

Ref: [Redowan Delowar - Omitting dev dependencies in Go binaries](https://rednafi.com/go/omit_dev_dependencies_in_binaries/)

Today I got a chance to finish my 2nd-pass over this article.

Problem: Updating dependencies (Go version -> golangci-lint etc) with least effort.

Essentially, the idea is to add any tooling (such as linters) to the list of dev dependencies in the project.
It allows for easier, proactive, frequent updates to the project with `dependabot` integration.
This is not a new idea - other language ecosystems well support it.
The issue is primarily related to Go.

However, the practice of using a `tools.go` file is used in the Kubernetes project, as well as stated in the Go project's documentation. 
I intend to can give this a try in one of my projects in the future.

This article had been lurking in a background tab over the past couple of days.
So it's good to finally get this down into words.
