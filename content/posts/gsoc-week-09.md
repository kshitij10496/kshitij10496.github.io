+++
author = "Kshitij Saraogi"
categories = ["GSoC"]
date = 2016-07-24T00:00:00+05:30
description = ""
draft = false
slug = "gsoc-week-09"
tags = ["Sympy", "Python"]
title = "GSoC Week 09 - The One with Inequalities"

+++



This week I worked on solving trigonometric inequalities.

### **Trigonometric inequalities**

The primary univariate inequality solver - `solve_univariate_inequality`,  
depends upon the results of `solve` in order to solve the given inequality.
Taking a cue from [PR#10022](https://github.com/sympy/sympy/pull/10022) on incorporating `solveset` for inequalities, I worked on developing an approach for replacing the use of `solve` 
with `solveset` in solving inequalities. 

**Idea**

> Convert `Set`-type output from `solveset` to `list` objects similar to that returned by `solve`.

The most striking difference between both the APIs is the uniform `Set` output returned by `solveset`. 
Hence, the prime concern while transitioning from `solve` to `solveset` should be handling the various type of solutions.

Here are a few implementation ideas on the same:

- **FiniteSet** : finite number of solutions  
  Using the `list` constructor on these type of objects works extremely well.

- **ImageSet** : infinite number of solutions  
  This is generally the case with trigonometric functions as most of them are periodic in nature.
  We need to limit the number of solutions to be finite.  
  For this, I intend to use the a periodic interval: `[0, period]` as the basis for filtering the solution set.
  This returns a simplified `FiniteSet` of solutions which can be used to solve inequalities in a restricted interval.
  Following which we can generalise the output over the entire domain of the function.
  
  A major issue here is the representation of the final solution set.  
  For example: 
  
  ```python
  In []: solveset(cos(x)<0, x, domain=S.Reals)
  ⎡         π           3⋅π         ⎤
  ⎢2*n*pi + ─, 2*n*pi + ───  | n ∊ ℤ⎥
  ⎣         2            2          ⎦
  ```
  
  Currently, we do not have a `Set` object for representing this.  
  For this, we need to implement an *Indexed Union* : `Union(X(a) for a in I)`

  We can symbolically represent the above solution as `BigUnion(Interval(2*n*pi + pi/2, 2*n*pi + 3*pi/2), n, S.Intgers)`.

**After thoughts**

Also, this week my [PR#11277](https://github.com/sympy/sympy/pull/11277) on periodicity got merged finally.
I have updated the corresponding [PR#11141](https://github.com/sympy/sympy/pull/11141) which has been stalled for some time now.
Hopefully, it will get merged soon.

The next week I will devote my time to the implementation part of solving inequalities.

