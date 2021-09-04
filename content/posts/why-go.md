+++
author = "Kshitij Saraogi"
categories = ["Self"]
date= 2018-11-11T09:06:32+05:30
description = ""
draft = false
slug = "on-go"
tags = ["Go", "Lego"]
title = "Why I Write Go"
+++

**tl;dr**: This is not a rant about how Go is "superior" to other languages. It's all apples and oranges and I like them both, not at the same time, ofcourse! 🍎/🍊

-----------------------

**off-topic**: When I was a little boy 👦, I used to play all day long with my legos - constructing buildings, trucks, everything that I could imagine. Chaining dominoes with my parent's music collection cassettes, solving jigsaw puzzles and playing scrabble with my cousins. Good ol' days! 

------------------------

# Inspiration
Reading Rob Pike's post titled "[Less is exponentially more](https://commandcenter.blogspot.com/2012/06/less-is-exponentially-more.html)", I found myself introspecting about the way I write software. The article evoked some joy in me, stimulated that deep-seated feel-good core - the part of my being that enjoys programming. And I want to share it with everyone! 

# Why Go?
During my GSoC, I used to struggle with grasping the idea of classes implementing behaviours and how would it be useful for subclasses - inheritance. 

For example, let's consider a `Point` class representing a point in the Cartesian Space.   
1. Should `distance` be a method on this class?   
2. Does `distance` define the "behaviour" of a `Point`?   

*Not necessarily!  *

(After reading some mathematics on Measure Theory, I came to know that "distance" is a quantity defined by a "metric function" - property of the space rather than any entity.)  
In our case, the `distance` should be a method on the `CartesianSpace` rather than `Point`.

- The question that arises then is how can I assure that I can always compute distance between given pair of `Point` values, or any geometrical entity for that matter?   
- Should I just override the `distance` method in each geometrical class?  
- If so, what purpose does the base `distance` method in `CartesianSpace` serve now?

I would agree that these questions are subjective and I respect your solution to the problem. 

However, then I came to know about [Duck Typing in Python](https://kshitij10496.github.io/posts/duck-typing-in-python/) and it's approach to the problem. However, I was not satisfied with the Python implementation. It almost felt kind of a convenience pattern which was incompatible with Pythonic code. 

Eventually, I found about Go `interfaces`.(Plus, CSP! ❤️) 

# Things I like about Go 

Coming back to the question - *"Why I Write Go?"*, here are some of my favourite reasons:

- emphasis on separation between state and behaviour
- composition over inheritance; think *legos* 🧩
- simplicity in design; **less is more**, indeed

More importantly, I rediscovered the joy of putting tiny pieces togerther and building something greater than the sum of the individual parts (read off-topic).
In addition to writing “cleaner and more readable” code, I find a lot more clarity when it comes to solving problems and coherence in my thinking while implementing the solution. I guess that is the underappreciated USP of Go, for me, ofcourse! 😁

So what is your favourite programming language and why? 😃
