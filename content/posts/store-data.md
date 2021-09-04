+++ 
draft = true
date = 2018-10-29T22:37:54+05:30
title = "How to store data?"
slug = "" 
tags = []
categories = []
+++

While getting started with developing applications, one has to deal with a lot of data.
Given the vast variety of available "database" management systems, its pretty common to get confused.

Here are the basic ways to store an application data:
- In-memory
    - Useful for mock databases
    - Data loss once the program exits
- Disk storage
    - csv files, json etc
    - Read/Write heavy operations
    - Not scalable to larger dataset
    - The data organisation(schema) can become brittle
- SQL databases
    - Table based structure
    - Relations
    - Lots of options
- NoSQL databases
    - 
