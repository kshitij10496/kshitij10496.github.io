+++
author = "Kshitij Saraogi"
categories = ["Software"]
date = 2017-12-03T00:00:00+05:30
description = ""
draft = false
slug = "duck-typing-in-python"
tags = ["Python", "OOP"]
title = "Duck Typing in Python"
featured_image = "images/covers/duck-typing-in-python.jpg"
+++

## What is Duck Typing?

Python is a dynamic language which is strongly typed.
Dynamic binding is the capability to use an instance without regard for its type. It is handled entirely through a simple attribute lookup process. Whenever an attribute is accessed as `object.attribute`:
1. `attribute` is located by searching within the instance itself. This yields a positive result when the `attribute` being searched for is an instance variable or method.
2. If the instance does not have the required `attribute`, the instance's class definition is searched. All the class variables, class methods and static methods fall into this category.
3. If both these lookups do not return any result, the interpreter then proceeds to the base classes of the `object`(resolved by [MRO](https://youtu.be/cuonAMJjHow)). The first match found is returned.

The critical aspect of this binding process is it's *independence of the **type** of `object`*. Thus, if you try a lookup such as `object.name`, it will work on any `object` that happens to have a `name` attribute independent of the class of the `object`. This behavior is colloquially referred to as ***duck typing*** in reference to the adage *“if it looks like, quacks like, and walks like a duck, then it is a duck.”*

> The idea is that you don't need a type in order to invoke an existing method on an object - if a method is defined on it, you can invoke it.

## Where should I use it in my code?

More often than not we write programs, either deliberately or unwittingly that rely on duck typing. 

While defining classes, the *magic* methods(or *dunder* methods) implement some sort of protocol supported by language. For example,
- `__iter__` and `__next__` methods are used to implement the Iterator protocol. The instances of the class can now be used in `for` loops.
- if we declare the `__len__` and `__getitem__` methods inside a class, it's instances are called `sequences`. All the objects of this class are now subscriptable by index (similar to `list`) as well as can be iterated over.

## The Problem of Tabulation

Suppose we are asked to display a dictionary of country names and it's captial in a tabular format. Let us try to write a generic utility function which displays a given input mapping in a tabular form:

**Attempt 01**

```
def tabulate_mapping(mapping, headers):
    '''Tabulates the input mapping as columns with given headers.
    
    >>> mapping = {'India': 'New Delhi',
    ...             'USA': 'Washington',
    ...             'England': 'London'}
    >>> headers = ('Country', 'Captial')
    >>> tabulate_mapping_01(mapping, headers)
            Country |        Capital |
    ----------------------------------
            England |         London |
              India |      New Delhi |
                USA |     Washington |
    '''
    heading = ''
    for header in headers:  ##### NOTE 1
        heading += '{:>15}'.format(header) + ' |'
    print(heading)
    print('-'*len(heading))

    for k, v in mapping.items():  ##### NOTE 2
        print('{:>15} |{:>15} |'.format(k, v))
```

The code should look pretty straighforward to any programmer who has written even a few lines of Python. However, there are two salient features about the code which do not strike us at the first sight. After some experimenting, you will figure out the following:
1. Any iterable can be passed as `headers` i.e. `list`, `tuple`, user-defined sequences. Even unordered collections such as `dict`, `set` would also work.
2. Any object which implements an `items` method can be printed using `tabulate_mapping` function.

**Duck Typing At Work!**

Let us create a class which extends the Python built-in `list` and implements a `items` method.

```
class MyList(list):
    ''' A user-defined collection data type which extends the built-in list.
    
    >>> alphabet = MyList(*'ABC')
    >>> print(alphabet)
    ['A', 'B', 'C']
    >>> alphabet[1]
    'B'
    >>> for i, item in alphabet.items():
    ...     print(i, item)
    1 A
    2 B
    3 C
    '''
    def __init__(self, *args):
        super().__init__(args)
        
    def items(self):
        '''Alternate utility to `enumerate` on the instance'''
        for i, item in enumerate(self, start=1):
            yield i, item

```

Now, by the grace of Duck Typing, we can use the `tabulate_mapping` function with instances of `MyList` class. However, what if we do not want malicious objects use our code this way. We all know about SQL Injection. It's about time we become aware of our privacy.

## The Curious Case of Input Validation

In the function `tabulate_mapping`, observe that we have not written any code for validating the inputs. With Duck Typing in the fray, it is important to understand the need of a guideline on validating inputs. 

Programmers coming from a background of a statically typed background would be inclined to perform *static* type checks on the object. As we have seen, strict type check can be severely restrictive to the point where the developers miss out on the cool features Python has to offer.
i.e **Too much of `isinstance` and `hasattr` works but it is neither fun nor Pythonic!**

We will perform different kinds of input validation for the `tabulate_mapping` function based on the requirements:

1. If we want the `tabulate_mapping` to be generic utility which can work on any `mapping` object with `items` and iterable `headers`.

``` def tabulate_mapping_v1(mapping, headers):
        
        # Validate headers
        try:
            headers_iter = iter(headers)
        except TypeError as e:
            raise ValueError('headers needs to be an iterable.')

        # Validate mapping
         try:
             mapping_items = mapping.items()
         except AttributeError as e:
             raise ValueError('mapping should have an items method.')

        heading = ''
        
         for header in headers_iter:
             heading += '{:>15}'.format(header) + ' |'

         print(heading)
         print('-'*len(heading))
         
         for k, v in mapping_items:
             print('{:>15} |{:>15} |'.format(k, v))

```

2. If we want to restrict the `mapping` object to an instance of a subclass of the built-in `dict` and the `headers` are specified to be a `list` object:

``` def tabulate_mapping_v2(mapping, headers):
        
        # Validate headers
        if not isinstance(headers, list)
            raise ValueError('headers needs to be a list object.')

        # Validate mapping
        if not isinstance(mapping, dict):
            raise ValueError('mapping needs to be a dict object.')
     
        heading = ''
        
         for header in headers_iter:
             heading += '{:>15}'.format(header) + ' |'

         print(heading)
         print('-'*len(heading))
         
         for k, v in mapping_items:
             print('{:>15} |{:>15} |'.format(k, v))

```

# Conclusion

> Whenever writing Python, we need to clearly define the allowed interfaces that can be used in place of an object rather than on the basis of classes the object.

There is no distinction between the *right* way and the *wrong* way when it comes to dealing with objects in Python. The most Pythonic code at a given situation depends entirely on the requirements of the user and the practicality of the use cases. The consideration of Python's Data Model and duck typing can help one write clearer, readable and Pythonic code.