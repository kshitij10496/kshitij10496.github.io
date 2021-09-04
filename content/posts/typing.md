+++
author = "Kshitij Saraogi"
categories = ["Software"]
date = 2017-12-10T00:00:00+05:30
description = ""
draft = false
slug = "typing"
tags = ["Typing", "Python", "Go"]
title = "Typing in Python, Go and JavaScript"

+++


> Disclaimer: This post has been written from the point-of-view of a software developer rather than a theoretical computer science. So I ["ask for forgiveness"](https://stackoverflow.com/questions/11360858/what-is-the-eafp-principle-in-python) if the post seems too colloquial and pragmatic.

Reading through the articles on programming languages, you are bound to stumble upon statements similar to the following:
1. "Python is a strongly typed, dynamic language."
2. "Go is a statically typed, strong language."
3. "JavaScript is a dynamic language which is weakly typed."

(Aside: Wikipedia pages of inidividual languages themselves have a bullet titled "Typing Discipline" in the sidebox).

Depending upon your programming background and experience, the above statements might either look deceptively simple to read or seem downright counter-intuitive, yet they are the source of some very famous warts in the respective languages. 
A good understanding of the fundamentals behind such statements can help programmers develop more reasonable expectations from the code they write.

We begin by defining 4 terms central to the discussion, namely:
- Static Typing | Dynamic Typing
- Strong Typing | Weak Typing

The terms grouped together are sematically antonyms to each other.
Each group defines important characteristics of a programming language independent of the other group.

## Static Typing, Dynamic Typing
Whether a language is statically typed or dynamically typed depends on how the compiler/interpreter handles variables and at what point during the execution of the program.

### Static Typing
In a statically typed language, the variable itself has a type; if you have a variable that's an integer, you won't be able to assign any other type of value to it later. Some statically typed languages require you to write out the types of all your variables, while others will deduce many of them for you automatically. 

Moreover, the compiler can tell which the *type* of a variable, without executing the program.

### Dynamic Typing
In a dynamically typed language, a variable is simply a value bound to a name; the value(or object) has a type -- like "integer" or "string" or "list" -- but the variable itself doesn't. We can have a variable which, right now, holds a number, and later assign a string to it.

The programmer is free to bind names to different objects with a different type. So long as you only perform operations valid for the type the interpreter doesn't care what type they actually are. 

-------------
### Python
```python
>>> age = 21
>>> age = '21'
```
**Conclusion:** The type of name `age` is the type of the object it refers to at that particular instant. Moreover, no further restriction is laid on it with regards to what values it can/cannot hold in the future.

### Go
```go
age := 21
age = "21"
```

**Conclusion:** A compile time assignment error is raised. Once a type is associated with a variable, the variable cannot hold a value of other data types.
### JavaScript
```
age = 21
age = "21"
```

**Conclusion:** Same as Python

------------

## Strong Typing, Weak Typing

The distinction between such typing comes to the fore when we write programming statements which involves performing an operation on values of different *types*.

#### Expected Behaviors
- **Strongly typed language:** more likely to generate an error (either at runtime or compile time depending on whether the language is interpreted or compiled).
- **Weakly typed language:** either produces unpredictable results or perform implicit type conversions to make sense of the expression.

In order to resolve the error raised in a strongly typed language, the programmer needs to explicitly convert the type of values to the desired type.

The terms "strong" and "weak" are themselves relative by nature. Thus, a person calls some programming language "X" as strongly(or weakly) typed is totally subjective. From the First Principles perspective, what the person wants to claim is that language "X" enforces type checks before performing any operations. Every developer will have a different measure of how rigorous these checks are.

Rule of Thumb: the more type coercions (implicit conversions) for built-in operators the language offers, the weaker the typing. (This could also be viewed as more built-in overloading of built-in operators.) 
i.e a strongly typed language is restrictive of type intermingling.

Let us understand this distinction with 2 operations which every programmer must have comes across:
1. Adding a number to a string
2. Adding an integer to a floating point number


--------

### Python
1. Adding a number to a string
```python
>>> a, b = 10, 'K'
>>> a + b # Binary operation on different types
...
TypeError: unsupported operand type(s) for +: 'int' and 'str'

>>> a + ord(b) # Explicit type conversion of string to integer
85

>>> str(a) + b # Explicit type conversion of integer to string
'10K'
```
2. Adding an integer to a floating point number
```python
>>> a, b = 1, 2.5
>>> a + b # No error
3.5
```

**Conclusion:** Raises errors when sense cannot be made. Also, the interpreter is not restrictive enough to spoil the fun in programming.

### Go
1. Adding a number to a string
```go
func AddNumStr() {
     a, b := 10, "K"
     fmt.Println(a + b)
}
```

2. Adding an integer to a floating point number
```go
func AddNumFloat() {
     a, b := 1, 2.5
     fmt.Println(a + b)
}
```

**Conclusion:** In both the cases, an "invalid operation" compile-time error is raised.

### JavaScript
1. Adding a number to a string
```js
> a = 10
> b = "K"
> a + b
'10K'
```

2. Adding an integer to a floating point number
```js
> a = 1
> b = 2.5
> a + b
3.5
```
**Conclusion:** The compiler *implicitly* converts the type of values to make sense of the operation rather than raising errors.

------------


I hope that after reading this article, you are able to justify the statements regarding the type systems used in different languages. In this post, I explored these principles across Python, Go and JS just to cover a variety of examples. I encourage you to perform the same on the languages you know and share your results in the comments below.