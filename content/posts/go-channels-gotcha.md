---
title: "Go Channels Gotcha"
date: 2022-02-01T14:30:13+01:00
draft: true

slug: "go-channels-gotcha" 
tags: ["Go"]
categories: []
---

Recently, I discovered a gotcha while reviewing code at work working on goroutines and channels in Go.

Let's take the example of implementing Fibonacci Sequence from The Go Tour to understand the situation.

https://go.dev/play/p/PQLNv4sfG7G

What happens if we do not close the channel?



What is the stopping condition of the goroutine?

Learning
- Check whether the sender is closing the channel.

It's nothing fancy - just something that made me reflect on the importance of software engineering principles.
At least, the importance of adopting some practical guidelines from experience.
Also, it's good to refresh the fundamentals once in a while and reflect from practice.

Hopefully this will be useful to you while building your next cool product feature!

# References
- https://go.dev/tour/concurrency/4