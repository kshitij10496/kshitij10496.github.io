---
title: "Clojure From the Ground Up: Functions"
date: 2023-12-09T16:01:30+01:00
draft: false

slug: "cfgu-03" 
tags: ["clojure", "cfgu"]
categories: ["autodidact"]
---

Ref: [Clojure from the ground up: Functions](https://aphyr.com/posts/303-clojure-from-the-ground-up-functions)

Functions are verbs.

We can define symbols to values that will not change (called `immutable`) using `let`.
These symbols are only available with an expression ("scoped"). The symbols can be overriden to point to a different value.

`def` allows us to define mutable variables. These are helpful for experimentation.

`defn` is a shorthand to define functions.

The chapter builds an extremely powerful intuition behind the relation between `let` and functions.

Also, it's helpful to think about functions as "common patterns of computation".
While problem solving, I'm starting to adopt this approach as well:
- Look for patterns in the problem.
- Formulate a function to solve a simple pattern.
- Combine multiple patterns to solve the bigger problems. (composition using standard library functions)

> This is core pursuit of software engineering: organizing expressions. Almost every programming language is in search of the right tools to break apart, name, and recombine expressions to solve large problems.

I find this really insightful. Often, our mental models are constrained by the programming langauge we use.
The way a backend engineer approaches a problem is quite different from a frontend engineer.
I experienced this in a sense when I switched from Python to Go as my preferred language.
And now, learning LISP (Racket, Clojure) has afforded me an even simpler way to approach problems.
