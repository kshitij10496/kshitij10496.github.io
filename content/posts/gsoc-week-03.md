+++
author = "Kshitij Saraogi"
categories = ["GSoC"]
date = 2016-06-10T00:00:00+05:30
description = ""
draft = false
slug = "gsoc-week-03"
tags = ["Sympy", "Python"]
title = "GSoC Week 03 - The One With Function Range (Part II)"

+++



Hey !

This week I worked on implementing a method for finding the range of a function in a given domain.
Following from last weeek's research on the same, I tried to develop these utility functions.

### **Implementation**

Here, I have defined the two functions along with some of their implementation details:

**`continuous_in(f, x, interval)`**

The function returns the sub-domains as an `Union` of `Interval` in case a discontinuity exists in the `interval`. If the function is continuous in the entire domain, the `interval` itself is returned.

For this we need to consider 2 primary conditions:

- **Domain constraints for real functions**
I have also added some code for domain constraints in `sqrt` and `log` functions.
Using the `solve_univariate_inequality` method (as the name suggests, it solves univariate inequalities),
we calculate these constraints.  
Given `f(x) = sqrt(g(x))`, we determine the range of values of `x` for which the function `g(x) >= 0`.  
Similarly, for `f(x) = log(g(x))`, the interval of `x` in which `g(x) > 0` is the constrained interval. 

-  **Singularities**
For determining the discontinuities, I tried to solve the reciprocal of the given function using `solveset`:`
solveset(1/f, x, interval)`. The `singularities` function can also be used here but its implementation is 
restricted to rational functions only. There are possibilities of improving this function to create a universal
function which returns all the possible singularities of the function in a given domain.

**`function_range(f, x, domain)`**  

Like the name suggests, this method returns the range of a univariate function in a given domain. This function is primarily designed for the purpose of `solve_decomposition`.  

This function calls the above implemented `continuous_in` method for finding the actual domain of `f`. Following this, we iterate over each `Interval` object returned by `continuous_in`. 

By using the boundaries of the interval and first derivate test, we determine the crtical points in the interval 
and their corresponding critical values.  

For determining the values of the function at the singularities, we determine its limit at that point. 
For this, I use the `limit` function of SymPy.

After calculating the local extremas, I calculate the global minima and maxima using the `inf`(infimum) and `sup`(supremum) of the `FiniteSet` of all critical values. The range, which is the `Interval` of these extremasm, is returned.

### **$ git log**

[PR#11141](https://github.com/sympy/sympy/pull/11141): Method for solving equations using Decomposition and Rewriting
_Opened this week_   
[PR#11224](https://github.com/sympy/sympy/pull/11224): Methods for finding the range of a function in a given domain 

**Final Thoughts**

That was all for this week.  
My task for the upcoming days would be to update my `solve_decomposition` method to accomodate these methods.
I aim to get all these PR merged before the midterm evaluation.