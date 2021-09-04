+++
author = "Kshitij Saraogi"
categories = ["GSoC"]
date = 2016-06-24T00:00:00+05:30
description = ""
draft = false
slug = "gsoc-week-04-05"
tags = ["Sympy", "Python"]
title = "GSoC Weeks 04 & 05 - The One with Periodicity"

+++



Hi folks !

The past couple of weeks were spent of developing heuristics for determining the
fundamental period of a given trigonometric function.

In our higher school, we all must have come across `Trigonometric Functions`.
One of the most striking properties of these functions is their periodicty.  
The ability of a function to repeat its values in regular intervals has always
caught my imagination.

## **Motivation**

Well, SymPy ought to have a functionality to determine the period of a function.
The instigated me to implement this function now was the build failure in my 
PR#11141 on `solve_decomposition`. 

### **Issue**

`function_range(sin(x), x, domain=S.Reals)` causes the build to time-out as the 
number of critical points of `sin(x)` in the entire real domain is infinite.
The same goes for other trigonometric functions as well.

However, if we can set the `domain` argument to be a finite interval which 
encompasses the entire behaviour of `sin(x)` over the entire real domain, our 
issue can be solved.

This led me to the idea of using the periodicity of the function as its domain.

## **Design**

`f = sin(x) + sin(2*x) + cos(3*x)`

We know that the period of `f` is `2⋅π` 
i.e. the LCM of the periods of individual function.

_It is known !_

Hence, in order to find the period of `f`, we need the functionality to determine
the period simpler trigonometric functions such as `sin(x)`, `sin(2*x)` and `cos(3*x)`

### **Property**

> If the period of `g(x)` is `T`, then the period of `g(a*x)` is `T/a`.


Using this property, we can easily compute the periods of `sin(2*x)` and `cos(3*x)`
with our knowledge of the periodicity of the fundamental trigonometric functions.
