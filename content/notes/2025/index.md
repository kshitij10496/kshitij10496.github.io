---
title: "2025"
date: 2025-03-25T15:59:21+01:00
draft: false

slug: ""
tags: []
categories: []
---

### March 25

#### [Sorting Go Slices][1]

This article makes a strong case for using the "generic" implementation (provided by the `slices` package) for sorting slices in Go.
I have used the `sort.Interface` interface as well as the `sort.Slice` function to sort slices. For precisely the same reasons listed in the post, I have never felt comfortable with either of them. The next time I need to sort a slice, I will make sure to give the `slices.Sort` function a try.

[1]: https://rednafi.com/go/sort_slice/
