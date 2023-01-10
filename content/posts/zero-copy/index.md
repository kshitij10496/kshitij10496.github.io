---
title: "Zero Copy"
date: 2023-01-10T15:35:37+05:30
draft: false

slug: "zero-copy" 
tags: ["go", "kafka", "fileserver"]
categories: ["software", "journal"]
---

Fundamentally, a lot of API development is about gathering, manipulating, and tranferring data across processes.
The concept of copying data from one memory area to another memory area is integral to the efficiency of the system.
My interest is to better understand how this "copy" operation works.
More so, I want to learn how to make this copy process efficient from a software engineer's POV.

Usually when a user space process (our application binary) has to execute system operations like reading or writing data from/to a device (disk, network etc.) through their high level software interfaces (language runtime), or like moving data from one device to another, etc., it has to perform one or more system calls that are then executed in kernel space by the operating system.[^1]
Most often these system calls belong to `read`[^5] and `write`[^6] family.
However, these context switches from user space to kernel space are time consuming, thus expensive.

The idea is to reduce the data tranfer operations using efficient system calls that do not perform such context switches.
These system calls transfer bytes from one File Descriptor to another within the kernel space.
Examples of such calls include `sendFile`[^7] and `splice`[^8] among others.

I would defer to an [article from IBM](https://developer.ibm.com/articles/j-zerocopy/?mhsrc=ibmsearch_a&mhq=copy#trad) which beautifully explains the intricacies.

# Applications

- Kafka uses zero-copy data transfer optimizations for high throughput between disk data and network.[^3][^2]

- [Go HTTP FileServer](https://pkg.go.dev/net/http#FileServer) from standard library leverages zero-copy techniques [^4].

It's pleasantly surprising to discover that the tools I use already implement this concept.
This idea of zero copy helps improve my mental model about distributed system design.


[^1]: [Wikipedia - Zero-copy](https://en.wikipedia.org/wiki/Zero-copy)

[^2]: [YouTube - System Design: Why is Kafka fast?](https://youtu.be/UNUz1-msbOM)

[^3]: [The Log: What every software engineer should know about real-time data's unifying abstraction](https://engineering.linkedin.com/distributed-systems/log-what-every-software-engineer-should-know-about-real-time-datas-unifying)

[^4]: [SoByte - Building a Zero-Copy File Web Server in Golang](https://www.sobyte.net/post/2022-07/go-zerocopy/)

[^5]: [Wikipedia - read (system call)](https://en.wikipedia.org/wiki/Read_(system_call))

[^6]: [Wikipedia - write (system call)](https://en.wikipedia.org/wiki/Write_(system_call))

[^7]: [Linux Manual Page - sendfile(2)](https://man7.org/linux/man-pages/man2/sendfile.2.html)

[^8]: [Wikipedia - splice (system call)](https://en.wikipedia.org/wiki/Splice_%28system_call%29)