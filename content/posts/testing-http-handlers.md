+++ 
draft = true
date = 2018-10-30T19:20:46+05:30
title = "Yet Another HTTP Handlers Testing Post"
slug = "" 
tags = []
categories = []
+++

## What do you want to test?
- Handlers return correct HTTP status code
- Correct HTTP Headers
- Expected Response Bodies

## Problems:
- Handle dependencies like DB
- Mocking data while TDD

## Solutions
- `testing`
- `httptest`
    - `httptest.ResponseRecorder`

## Reads
- https://echorand.me/dissecting-golangs-handlerfunc-handle-and-defaultservemux.html
- https://www.digitalflapjack.com/blog/2018/4/10/better-testing-for-golang-http-handlers
- https://blog.questionable.services/article/testing-http-handlers-go/
- https://www.alexedwards.net/blog/organising-database-access
- https://mycodesmells.com/post/tdd-with-golang-web-app-part-2:-database


## References
- justforfunc