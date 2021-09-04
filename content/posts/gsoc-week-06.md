+++
author = "Kshitij Saraogi"
categories = ["GSoC"]
date = 2016-07-01T00:00:00+05:30
description = ""
draft = false
slug = "gsoc-week-06"
tags = ["Sympy", "Python"]
title = "GSoC Week 06 - The One with Singularities"
+++



This week I worked on the topic of *singularities*.


### ***Singularities***

> A singularity is in general a point at which a given mathematical object is not defined.

Examples:

- `1/x` has a singularity at `x = 0` as it seems to reach infinity.
- `|x| (Absolute)` has a singularity at `x = 0` since it is not differentiable at that point.
- `√x (Square root)` has a singularity at `x = 0` since it doesnot admit a tangent there.

In real analysis, singularities are either discontinuities or discontinuities of
the derivative (sometimes also discontinuities of higher order derivatives).

A **removable singularity** of a function is a point at which the function is undefined, 
but it is possible to redefine the function at that point in such a way that the resulting 
function is regular in a neighbourhood of that point.

For instance, 

`f(z) = sin(z)/z` has a removable singularity at `z = 0`.  
This singularity can be removed by defining `f(0) := 1`, which is the limit of `f` as `z` tends to `0`.

In SymPy, we try to automatically simplify some of the expressions before passing it for
further processing.

For example,

- `x/x` simplifies to `1`.
- `(x-1)^2/(x-1)` simplifies to `x-1`.

At times, this can lead to incorrect behaviour.
Suppose, we are interested to find the singularities ( and/or domain ) of the function `f(x) = x/x`.

```
In []: f = x/x
In []: singularities(f, x)
Out[]: S.EmptySet # no singularities
In []: continuous_domain(f, x, S.Reals) # finding the valid domain of f on the real line
Out[]: S.Reals # should be (-oo, 0) U (0, oo)
```

After some discussion about this issue of automatic simplification, we came to the
conclusion that removable singularities should be treated as part of the domain of the function.
This will help in justifying the behaviour of expressions which are automatically simplified.

So, I studied about how to classify a singularity as a removable one.
For this, we use the **Reimann's theorem**:

>  Let `f` a function defined on the set `D \{a}`.
   The point `a` is a removable discontinuity if there exists a neighborhood of `a` on which `f` is bounded.

Mathematically,

`lim   (z -a)*f(z)`  
`z->a+` 

I have implemented this theorem in the form of a function but I face certain issues with
the values returned by `solveset` due to `check_domain` function (which checks the bound of a 
function at a particular value). This remains to be discussed in the meeting.


**After Thoughts**

I have lots to discuss with my mentors on these issues.  
After merging the PR#11277, I think `solve_decomposition` method will be good to go.
