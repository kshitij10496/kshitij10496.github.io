+++
author = "Kshitij Saraogi"
categories = ["GSoC"]
date = 2016-07-07T00:00:00+05:30
description = ""
draft = false
slug = "gsoc-week-07"
tags = ["Sympy", "Python"]
title = "GSoC Week 07 - The One With Generalised Periodicity"

+++



This week I updated my [PR#11277](https://github.com/sympy/sympy/pull/11277) to find the period of a **general function**.
   
### ***Periodicity***

In the past few weeks, I dedicated a lot of my time reading about the property of periodicity of a function.
Earlier, I had implemented a trivial(and restricted) functionality for this task.
This motivated me to study this topic as I planned to generalise the function.

Here are my notes on periodicity which were the literature reference for the development of the method:

- Note that `2π` is a period of `sin(x)`.
But `sin(x)` has many other periods, such as `4π`, `6π`, and so on. 
However, `sin(x)` has no (positive) period shorter than `2π`.

- > If `p` is a period of `f(x)`, and `H` is any function, then `p` is a period of `H(f(x))`. 

- > For sums and products, the general situation is complicated. 

  Let `p` be a period of `f(x)` and let `q` be a period of `g(x)`. 
  Suppose that there are positive integers `a` and `b` such that `ap=bq=r`.  
  Then `r` is a period of `f(x)+g(x)`, and also of `f(x)g(x)`.  
  However, the point to note here is that `r` need not be the shortest period of `f(x)+g(x)` or `f(x)g(x)`.
  
  For example: 
  The shortest period of `sin(x)` is `2π`, while the shortest period of `(sinx)**2` is `π`. 
  
  Another example: Let `f(x)=sin(x)`, and `g(x)=−sin(x)`.
  Each function has smallest period `2π`. But their sum is the `0`-function, which has every positive number `p` as a period!

- > If `p` and `q` are periods of `f(x)` and `g(x)` respectively, then any common multiple of `p` and `q` is a period of `H(f(x),g(x))` 
  > for any function `H(u,v)`, in particular when `H` is addition, multiplication or division. However, it need not be the smallest period.

- > The sum of two periodic functions need not be periodic. 
  
  For example: Let `f(x)=sin(x)+cos(2πx)`. 
  The function is not periodic.   
  The problem is that `1` and `2π` are incommensurable. There do not exist positive integers `a` and `b` 
  such that `(a)(1)=(b)(2π)`.


### ***Issues***

I am abstracting the details of implementation so as not to make the post even further boring.

During the period of development, I faced few issues and had a lot of queries to make.

1. The new implementation returns a value which might not be the **fundamental period** of the given function.
The previous implementation, though limited, returned the fundamental period of the given function.

2. The ability to find the LCM of irrationals.
We will be dealing with the iconic `π`(and its multiples) in many of our cases(as is evident from the example above).
Currently, we donot have the functionality to find the LCM of
irrational numbers. A method needs to be developed to handle this issue.

3. Issue with automatic simplification while verifying the result.


**After Thoughts**

I am looking forward to addressing all these issues in tonight's meeting.
Apart from that, implementing this was a lot of fun.
I got to learn about inheritance and abstraction while implementing instance methods for periodic functions.

Hopefully, all my effort doesn't go in vain.

Till next time !
