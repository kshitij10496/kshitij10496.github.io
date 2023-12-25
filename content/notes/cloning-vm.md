---
title: "CodeSandbox: How we clone a running VM in 2 seconds"
date: 2023-12-19T21:17:57+01:00
draft: false

slug: "cloning-vms" 
tags: ["engineering", "firecracker"]
categories: []
---

Ref: https://codesandbox.io/blog/how-we-clone-a-running-vm-in-2-seconds

Amazing engineering work here!

Two key technologies leveraged here:
- [Firecracker](https://firecracker-microvm.github.io/), in particular microVMs.
- [Copy-on-Write](https://en.wikipedia.org/wiki/Copy-on-write?useskin=vector) resource management technique.

The concept of memory snapshotting is elaborately described. 
More so, I found the deep dive into the engineering work to put the pieces together very inspiring.

I need to study and read up about Firecracker and the concept of KVM.
Let me know if you have any good resources for this.
