+++
author = "Kshitij Saraogi"
categories = ["Software"]
date = 2017-12-17T00:00:00+05:30
description = ""
slug = "for-some-context"
tags = ["Go", "Python"]
title = "For some Context"
featured_image = "images/covers/for-some-context.png"
+++

There are a lot of good resources about using `context` packages in software based on your programming language. However, I found that most of these do not address the basic questions of motivation behind the need of context:
- How does the use of context help us in programming?
- When should a programmer use context?

In this blog post, I will share what I understand about `context`.

## Motivation
Consider you are an event manager of a restaurant. A customer wants to throw a party for 50 people on New Year Eve and you are tasked with organizing the event. Given the magnitude of the event, you start planning and assign jobs to your suboridinates:
- waiters are instructed to look their best, 
– chefs must prepare the grocery list,
- errand boys to fetch the grocery.
- playlist for the "DJ",
- someone for decoration

The preparations are going smoothly on your end and you expect a picturesque celebration under your leadership. However, a couple of days later the same customer profusely apologizes for cancelling the event due to some reason.
Even though you are disappointed by this request, you accept the apology.

There are two alternates for you to choose from:
1. Immediately cancel all the arrangements
2. Wait till the New Year Eve for some other miraculous booking

Being a rational manager, you immeditately start off to cancel all arrangements rather than waiting till the New Year's eve because you do not want to waste resources(time and money).

This is exactly what "context" is used for in programming:
- Cancellation progropagation
- Scoping values (passing grocery list around, organizing the playlist)
The use of context can make programs efficient with respect to use of computer resources as well as graceful fallback mechanism.

Let us understand how we can use `context` with a simple example.

```
// Some time consuming process like:
// - API calls
// - Cruching data from database
//
func someFunc() {
    fmt.Println("Starting computation")
    time.Sleep(10*time.Second)
    fmt.Println("Completed computing")
```

Now, the caller of this function is expected to wait for a while (10s in this case) until the processing is complete. However, if the user somehow decides to cancel this process before it completes, he is at a loss. The only way the user can exit is by `CTRL` + `C` i.e by sending an interuption signal to the running process; this maynot even be possible all the time. However, the use of `context` provides him a way to set time deadlines or logical cancellations. Maybe the user wants to wait for atmost 5 seconds before cancelling; the context gives him this power.

# Resources
- [justforfunc#9: The Context Package in Go](https://youtu.be/LSzR0VEraWw)
- [Go Concurrency Patterns: Context](https://blog.golang.org/context)