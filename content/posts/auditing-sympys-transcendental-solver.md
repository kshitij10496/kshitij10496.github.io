+++
author = "Kshitij Saraogi"
categories = ["GSoC"]
date = 2016-05-15T00:00:00+05:30
slug = "auditing-sympys-transcendental-solver"
tags = ["Sympy", "Python"]
title = "Auditing SymPy's Transcendental solver"
+++

  
Having considered the current codebase of `_tsolve` function, I find the following few points considered while implementing the new solver:  

- modularise the code for various classes of equations(LambertW, `bivariate` equation type, logarithmic, exponential).  
- using SymPy `Set` objects internally, instead of using the built-in Python `lists`.  
- use of `decompogen` function to check for possible decomposition of the given expression into simpler functions.
- handle the case where the given equation has no closed-form solution and infinite recursion occurs.

These are just a handful of strategies that I intend to use. However, the whole process of development is going to a lot more complex and might need some more considerations from my side.  

### Task : Implement `transolve` function.

My plan is to do a _test-driven development_ for this solver.  
For this, I will start by porting the relevant tests present in `test_solvers.py` module to the `test_solveset.py`.
Following this, I will start the developement process of the `transolve` solver.  

I aim to accomplish a major portion of this task by the end of this week.

Thats all for now. 
And the coding begins !