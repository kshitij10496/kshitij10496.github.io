+++
author = "Kshitij Saraogi"
categories = ["GSoC"]
date = 2016-06-04T00:00:00+05:30
description = ""
draft = false
slug = "gsoc-week-02"
tags = ["Sympy", "Python"]
title = "GSoC Week 02 - The One With Function Range (Part I)"

+++



This week I worked on developing methods for computing the range of an univariate function.
For this pupose, I spent most of my time in research; reading previous discussions on mailing lists, pull requests and wikis.

### **Progress**

Suppose, we want to solve the following equation in the variable `x`:

`sin(x) = π / 2`

We can straight away state that this equations has *no solutions* as the range of the function `sin` is -1 to 1   
i.e `sin(x) ∈ [-1, 1]`.
 
Thus, we find that the range of the function can also be used to leverage the solutions of an equation. The implementation of a function to determine the range of a function in a given domain is particularly interesting for checking whether an equation is at all solvable.

In the last meeting, Amit had suggested me to read the conversation on

* [PR#2723](https://github.com/sympy/sympy/pull/2723) : Fixed imageset for Interval
* [PR#2925](https://github.com/sympy/sympy/pull/2925) : find singularities for any expression. 

Along with this, I read the following mailing lists discussions:

1. [Find minimum value of a function symbolically](https://groups.google.com/forum/#!searchin/sympy/minimize/sympy/Na_p5pm1I7M/V6uv4ZAkp2oJ) 

2. [Best way to find extrema of function over interval](https://groups.google.com/forum/#!topic/sympy/8TM8cnuzkG8)

3. [GSoC 2013 Idea - Find Domain / Range / Continuity / Singularity of a Function](https://groups.google.com/forum/#!searchin/sympy/singularity/sympy/ijhl7rkHEbk/lsWTuJ2Nb8wJ)

4. [On a general representation for singularities and infinities](https://groups.google.com/forum/#!searchin/sympy/singularity/sympy/c_fpCu9QiII/n2KaXN-z3rwJ)

5. [Functions: Singularity and Continuity](https://groups.google.com/forum/#!searchin/sympy/singularity/sympy/mJlCxuZ5uZw/peWogHzbKekJ)

All this research helped me appreciate the difficulty of the problem at hand. Also, my approach to solving this issue is heavily inspired from these discussions. 

### **Design**

The methodology of determining the range of a function:

1. Determine the points of discontinuities in the concerned domain.
2. Divide the entire domain into sub-domains about the above-determined singularities.
3. Use the [Derivative Test](https://en.wikipedia.org/wiki/Derivative_test#Second_derivative_test) to locate the critical points of the function within each sub-domain.
4. Calcuate the corresponding values of the function at the critical points and the boundary values of the sub-domains.
5. The extremas of the function in the entire domain are the maximum and minimum values in all the smaller domains combined.

For now, I have thought of designing 2 functions to solve this issue:

1. Function to divide the domain into sub-domains.
2. Function to calculate the extremum values.

### **$ git log**
[PR#11141](https://github.com/sympy/sympy/pull/11141) : Method for solving equations using Decomposition and Rewriting
[PR#11164](https://github.com/sympy/sympy/pull/11164) : Intersection of certain ImageSets with Intervals
 
### **Thoughts**

After tommorrow's meeting, I will iron out a more concrete design.
My goal for next week would be to implement the above-said functions.

Looking forward to another exciting week !
