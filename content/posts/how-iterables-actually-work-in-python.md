+++
author = "Kshitij Saraogi"
categories = ["Medium", "Software"]
date = 2017-08-28T00:00:00+05:30
description = ""
draft = false
slug = "how-iterables-actually-work-in-python"
tags = ["Python", "iterable"]
title = "How Iterables Actually Work in Python"

+++

This past week I read about Python's iterator protocol and how the philosophy of iteration is deeply embedded into the language design. Many features that I love about Python such as list comprehensions, tuple unpacking leverage the power of iterator protocol. I wrote an [article](https://hackernoon.com/how-iterables-actually-work-in-python-65c36ff91c1e) on Medium explaining how developers can implement it and use these features much more efficiently in their day-to-day life.

---

One of the more impressive features of Python language is the use of “for-each” looping construct that has awed me ever since I started out with Python. For the uninitiated, here is a simple *for* loop which prints the first 10 natural numbers:

```py
for num in range(1, 11):
    print(num)
```

We can also loop over the primitive types such as *list*, *tuples*, *dictionaries* and *strings* in similar ways:

```py
numbers = [1, 2, 3, 4, 5]
record = ('Kshitij', 21, 'Loves Python')
details = {
        'name': 'Kshitij',
        'age': 21
       }for num in numbers:
    print(num) # 1 2 3 4 5for data in record:
    print(data) # Kshitij 21 Loves Pythonfor key, value in details.items():
    print(key, value) # age 21 name Kshitij
```

As one implements few data structures in Python using `class`, he feels the desire to loop over the data stored in it’s instances. This is where the Iterator Protocol comes into picture.

## Sample Implementation

Let us suppose we are tasked with implementing a [standard deck of playing cards](https://en.wikipedia.org/wiki/Standard_52-card_deck). A sample implementation might look something like this:

{{< gist kshitij10496 05dd4ff26257da28e5494b502359508d >}}

This works fine with regards to creating new instances of `Deck` and representing it. However, a major pain point in this implementation is the lack of ability to iterate over the `Deck` object.

```py
>>> from cards import Deck
>>> new_deck = Deck() # New deck instantiated
>>> print(new_deck)
... # Works great
>>> for card in new_deck:
...     print(card)TypeError: 'Deck' object is not iterable
```

One can be smart enough to explore the instance `new_deck` and conclude that the `cards` attributes holds the data required for iterations and it, in fact is a `list` . With this knowledge, he can hack the above loop as follows:

```py
>>> for card in new_deck.cards:
...     print(card)
Card(...)
..
..
```

This code works great. However, the end user must attain the internal information about the implementation to perform the iteration. This makes our code lose the advantages of data abstraction and leads much to be desired of the implementation.

> There must be a better way!

Urged by the enthusiasm from Raymond Hettinger, I searched for ways to improve my implementation to couple with the Python’s `for` loop.

And soon I found the answer — **The Iterator Protocol**.

## The Iterator Protocol

In order to learn what the Protocol is and how to implement it in Python, we need to understand some basic terms.

### Iterable

- It is any object that *you can loop over with a for loop*.
- [Iterables](https://docs.python.org/3/glossary.html#term-iterable) are not always indexable, they don’t always have lengths, and they’re not always finite.
- An iterable can be passed to `iter()` built-in function to get an iterator for them.

### Iterator

- Iterators have exactly one job: return the “next” item in our iterable.
- [Iterators](https://docs.python.org/3/glossary.html#term-iterator) can be passed to the built-in `next` function to get the next item from them and if there is no next item (because we reached the end), a `StopIteration` exception will be raised.
- Iterators return themselves when passed to the `iter()` built-in.

## The Protocol

### Step 01: How the `iter()` built-in works?

Whenever the interpreter needs to iterate over an object `x`, it automatically calls `iter(x)`. The `iter` built-in function:

1. Checks whether the object implements, `__iter__` method and calls that to obtain an `iterator`.
2. If `__iter__` method is not implemented, but `__getitem__` method is implemented, Python creates an *iterator* that attempts to fetch items in order, starting from index `0`.
3. If that fails, Python raises `TypeError` exception saying `<classname> object is not iterable`.

### Step 02: How to implement the Protocol?

I will present two approaches to implementing the Iterator Protocol:

#### Approach 1: Traditional Way

1. Create a new class representing the *iterator*(say **DeckIterator**).
2. Implement the following two methods in **DeckIterator**:

    `__next__` : returns the next item in the iterable.
    `__iter__` : returns itself i.e `self`.
3. Define an `__iter__` method in the class over whose instances you want to iterate i.e. class `Deck`. The method should return an instance of **DeckIterator**.

#### Approach 2: The Pragmatic Way

1. Implement the `__iter__` method in the **Deck** class as a *generator function*.

{{< gist kshitij10496 1aa0fed94b1aaba6165a73220f5fe77a >}}

**Features**

This is the list of all the features that our object magically seem to support as soon as we implement the protocol.

1. Iteration via `for` loop
2. Unpacking similar to tuples
3. Can be used in list comprehensions
4. Can be used with built-in functions (such as `min`, `max`) which consume an iterable.

```py
>>> new_deck = Deck()>>> # 1. Looping through a for loop
>>> for card in new_deck:
...     print(card) # Works great!>>> # 2. Unpacking similarly to tuples
>>> first_card, *rest, last_card = new_deck>>> # 3. List Comprehensions
>>> spades = [card for card in new_deck if card.suit == 'Spades']>>> # 4. Built-in functions
>>> max_card, min_card = max(new_deck), min(new_deck)
```

# Lessons Learnt

1. Iterators in Python aren’t a matter of type but of the protocol i.e. any class that implements this protocol can be iterated over.
2. Python *groks* iteration.

I hope that the knowledge of the Iterator Protocol will help you out when writing Python. In order to raise awareness about this seemingly under appreciated feature of Python, I have proposed a [talk at PyCon India 2017](https://in.pycon.org/cfp/2017/proposals/iterators-generators-and-you~e9OYb/) on this topic.
