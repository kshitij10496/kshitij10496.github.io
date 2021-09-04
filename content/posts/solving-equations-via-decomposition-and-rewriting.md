+++
author = "Kshitij Saraogi"
categories = ["GSoC"]
date = 2016-05-22T00:00:00+05:30
description = ""
draft = false
slug = "solving-equations-via-decomposition-and-rewriting"
tags = ["Sympy", "Python"]
title = "Solving equations via Decomposition and Rewriting"

+++



A robust framework for solving equations is a salient feature of any Computer Algebra System. An important idea in this regard is **"Rewriting and Decomposition"**. By using this techniques, we try to reduce the given equation to a set of simpler equations which can be solved with relative ease.

An example here would be the best way to establish the significance of the above idea.

If we have to solve for `x` in the equation `f(x) = 0`, where   
`f(x) = ln(x)**2 - 3*ln(x) + 2`

This problem can be approached with the idea of "Decomposition and Rewriting". 
Here is the procedure:

1. **Decomposition**
The step involves a decomposition of the given function into smaller, constituent functions.
In the above case, we decompose f(x) as:
`f(x) = g(x)*2- 3*g(x) + 2` , where `g(x) = ln(x)`

2. **Rewriting**
Substituting `g(x)` with a dummy variable `t` in `f(x)`, we get a polynomial in `t`:   
`h(t) = (t -1)*(t-2)` , where `t = ln(x)`

3. We determine the values which satisfy the equation `h(t) = 0`.  
For our example: `t = 1` or `t = 2`

4. Back-substituting the value of `t` into these solutions, we get 2 independent equations in `x`:   
`ln(x)= 1` or `ln(x) = 2`

5. Solving these equations individually, we get the desired solutions of the inital equation `f(x) = 0` i.e.   
`x = exp(1)` or `x = exp(2)`

Thus, we get two possible solutions of the given complex transcendental equation through the methods of Rewriting and Decomposition. An important observation can be made with respect to the relative ease of calculating the solutions of the intermediate equations compared to that of the original equation. This motivates the development of a simpler and modular system for solving equations rather than a vast and case-specific one.

A well-designed implementation of the above technique can be of high value to the `solveset` system. This will be my task for the 1st week of GSoC. I created a Pull Request [PR#11141](https://github.com/sympy/sympy/pull/11141) with a primitive design. 
Reviews and suggestions are welcomed !
Thats pretty much it for now. In the next blog post, I will be writing in detail about the implementation process.  