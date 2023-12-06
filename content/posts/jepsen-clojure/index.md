---
title: "Aphyr - Why is Jepsen Written in Clojure?"
date: 2023-12-06T17:10:59+01:00
draft: false

slug: "aphyr-jepsen-clojure" 
tags: ["clojure", "jepsen"]
categories: ["notes"]
---

Ref: [Aphyr - Why is Jepsen Written in Clojure?](https://aphyr.com/posts/367-why-is-jepsen-written-in-clojure)

Just as I am developing an interest in the Lisp family of languages, particularly Clojure, I discovered Kyle's post on my feed.

Few things that stood out from this piece:
- Clojure's ability to interop with Java (and JVM primitives) opens up the potential to leverage an existing, mature ecosystem.
- Immutable, persistent data structures make it easier to write concurrent programs without static typing.
- Most of the times, "good enough" tech and pragmatism are enough to build useful software tools.
