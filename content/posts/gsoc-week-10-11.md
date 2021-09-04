+++
author = "Kshitij Saraogi"
categories = ["GSoC"]
date = 2016-08-07T00:00:00+05:30
description = ""
draft = false
slug = "gsoc-week-10-11"
tags = ["Sympy", "Python"]
title = "GSoC Week 10 & 11 - The One with `solvify`"

+++


      FiniteSet   | list

      ImageSet,   | list (if `f` is periodic)
      Union       |

      EmptySet    | empty list

      Others      | None
   


1. Adding `domain` support.  
    
    I added a `domain` argument to `isolve` whose default value is the real domain (`domain=S.Reals`).
    A few limitation to the conditions of `S.Infinity` and `S.NegativeInfinity` followed.
    
    Another noticable point, from the point of implementation, was to deal with singularities and discontinuities of the given inequality.
    For this, I used the `continuous_domain` method to find the continuous domains of the expression within the specified domain.    
    
    This was a minimalistic addition with considerable returns (especially for solving periodic inequalties).

2. Solving trigonometric inequalities.
    
    Since most of the trigonometric inequalities are periodic in nature and have infinite solutions, 
    solving the expression in the entire real domain is a repetitive task and computationally expensive.

    In order to simplify the problem, I intend to solve all the inequalities in a positive periodic interval (say `[0, 2*pi)` for `sin(x)`).
    We already have a function to compute the real period of a function : `periodicity`.  
    In case of a non-finite `domain` argument, I intend to use this to restrict the solutions of the problem to a periodic interval.

    This might not seem the perfect approach but it seems reasonable to handle infinite interval sets for now.
    We need a new `Set` object : `BigUnion` to represent infinite number of interval objects.


 
### *New Implementation*

I have opened [PR#11458](https://github.com/sympy/sympy/pull/11458) for the same with all the implementation details.

```python
In []: isolve(cos(x) > S(0), x, relational=False)
Out[]: [0, pi/2) U (3*pi/2, 2*pi)

In []: isolve(tan(x) > S(0), x, relational=False)
Out[]: (0, pi/2)
```

### *After thoughts*

For the past couple of weeks, I haven't been able to give much time to the project due to my college schedule.
I try to make up for the lost time during the weekend and meet the 40 hour weekly deadline.

With the endsem evaluation soon approaching, I expect this PR to get merged and count as a part of my project.
