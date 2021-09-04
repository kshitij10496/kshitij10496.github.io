+++
author = "Kshitij Saraogi"
date = 0001-01-01T00:00:00Z
description = ""
draft = true
slug = "what-are-first-class-values"
title = "First-class citizenship"

+++

Often I come across statements such as:
- "Functions in Python are first-class values"
- "Channels are first-class values in Go"

This puzzles as I couldn't grasp what the vernacular is and what the speaker wants to convey by this statement. Due to my relatively less experience in the field of software development.

In sociology, a "**first-class citizen**" refers to a member of a class of individuals that receive fair treatment while the individuals who receive inferior treatment are said to be "second-class citizens". Using an analogy between human societies and programming languages, we can understand the use of "first-class" terminology used by software developers when describing features of programming languages.


# First-class
**ASIDE**: Throughout the article, the term "entity" can be used interchangeably with any of the following:
1. Function
2. Class
3. Object
4. Type

Every programming language has a basic set of language features that one can use to manipulate values in order to write programs. These are things like: 
- "pass a value to a function", 
- "bind a variable to a value", 
- "use the variable as if it were the value"

Whenever you see that a claim that a language has "X as first class values", or has "first class Xs", this means that the language allows you to use those basic language features on Xs. 

The notion of a "first-class" citizen is not formally defined in programming languages. But it generally means that an entity has three properties:

1. It can be **used** like "ordinary" values
     - passed and returned from functions
     - stored in containers

2. It can be **constructed** in a way similar to "ordinary" values
    - locally in function scope
    - in an expression

3. It can be **typed** just like any "ordinary" value
    - there is a type assigned to such an entity
    - it can be freely composed with other types.

# First-class functions in Python
Functions in C/C++ are not first-class. While (1) and (3) are arguably available through function pointers, (2) is not supported for functions proper.

However, in Python, functions are first-class citizens.

```python
def negate(x):
    return -x

input = [1, 2, 3, 4, 5]
result = map(negate, input)
```

# First-class channels in Go

# Conclusion
In a given programming language, a first-class citizen is an entity for which the language supports all the basic operations much in the same way societies treat it's first-class members.

Operations of interest:
1. Passing entity as function arguments
2. Return entities from a function
3. Assigning entities to variables

> If all the above-mentioned operations are supported by an entity, you can call it a "first-class" citizen.

> If developers say "Entity E is a *first-class* entity in Language X", it means that the **Language X** supports passing **Entity E** as arguments to functions, returning them from functions and assigning them to variables.

Note: The definition of first-class citizenship is dependent on the programming language we are talking about. Thus, a particular entity is "first-class" in language X does not imply that this entity is also a first-class citizen in language Y and vice-versa.