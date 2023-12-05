---
title: "Redis Hash Slots"
date: 2023-11-30T13:44:34+01:00
draft: true

slug: "" 
tags: []
categories: []
---

Let's say your application uses a Redis cluster.
And say you desire to operate on codependent keys in a single pipeline.

You might encounter the following error: ```CROSSSLOT Keys in request don't hash to the same slot```

The way to fix it is to force Redis to hash codependent keys into the same hash slots explicitly.
All you need to do is to wrap the part of the key that should be taken into consideration by Redis while hashing with a pair of curly brackets.

For example:

```
opinion_summary_of_entity_{%s_%s}", eType, eID)
opinion_summary_of_entity_%s_%s
```