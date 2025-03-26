---
title: "2023"
date: 2023-01-01T00:00:00+02:00
draft: false

slug: "2023"
tags: []
categories: []
---

### December 6

#### [Aphyr - Why is Jepsen Written in Clojure?][1]

Just as I am developing an interest in the Lisp family of languages, particularly Clojure, I discovered Kyle's post on my feed.

Few things that stood out from this piece:
- Clojure's ability to interop with Java (and JVM primitives) opens up the potential to leverage an existing, mature ecosystem.
- Immutable, persistent data structures make it easier to write concurrent programs without static typing.
- Most of the times, "good enough" tech and pragmatism are enough to build useful software tools.

#### [Clojure From the Ground Up: Welcome][2]

Really neat article (and series) about program design from first principles.

I loved the emphasis on motivation and simplicity.

Lisp is ridiculously simple to write computation.
This post does a great job at developing intuition about programming.
I found a lot of traces from SICP in the mental model.

> You could think of this structure as a tree–which is a provocative idea,
because *languages* are like trees too: sentences are comprised
of clauses, which can be nested, and each clause may have subjects
modified by adjectives, and verbs modified by adverbs, and so on.

Extremely powerful concept.

---

### December 7

#### [Clojure From the Ground Up: Basic Types][3]

What is a "type" anyway?

> A type is a group of values which work in the same way. It’s a property that some values share, which allows us to organize the world into sets of similar things.

I find this to be a very neat and simple way to think about "types" in general.
Try to determine the appropriate type for a value based on how well it fits into a particular universe (programming language), and context (problem domain).

The definition of "type system" is particularly interesting. Also, the 2 dimensions of any type system - strong/weak, static/dynamic.

Some of the common programming constructs - symbols, lists, vectors, maps - provide a brief introduction to working with data.

> As software engineers, we model the world by creating a particular representation of the problem in the program. Having a rich set of values at our disposal allows us to talk about complex problems. In Clojure, we compose data structures to form more complex values; to talk about bigger ideas.

Sweet! Looks extremely promising.

---

### December 9

#### [Clojure From the Ground Up: Functions][4]

Functions are verbs.

We can define symbols to values that will not change (called `immutable`) using `let`.
These symbols are only available with an expression ("scoped"). The symbols can be overriden to point to a different value.

`def` allows us to define mutable variables. These are helpful for experimentation.

`defn` is a shorthand to define functions.

The chapter builds an extremely powerful intuition behind the relation between `let` and functions.

Also, it's helpful to think about functions as "common patterns of computation".
While problem solving, I'm starting to adopt this approach as well:
- Look for patterns in the problem.
- Formulate a function to solve a simple pattern.
- Combine multiple patterns to solve the bigger problems. (composition using standard library functions)

> This is core pursuit of software engineering: organizing expressions. Almost every programming language is in search of the right tools to break apart, name, and recombine expressions to solve large problems.

I find this really insightful. Often, our mental models are constrained by the programming langauge we use.
The way a backend engineer approaches a problem is quite different from a frontend engineer.
I experienced this in a sense when I switched from Python to Go as my preferred language.
And now, learning LISP (Racket, Clojure) has afforded me an even simpler way to approach problems.

---

### December 10

#### [Peter Norvig: Teach Yourself Programming in 10 Years][5]

I remember reading this article way back in my uni days. It reminded me of a popular quote from Richard Feynmann

Now that I have stumbled across it after few years of experience working as a professional software engineer, I related a bit more with the content.

Ways to develop a deep understanding:
- Write more significant programs that solve problems.
- Work with experienced programmers.


> "A language that doesn't affect the way you think about programming, is not worth knowing"

We need deliberate practice to continuously learn and grow.

---

### December 19

#### [Cheap Web][6]

This piece evoked the following emotions:
- Strong alignment in principle around how I envision Web technology (in general, any tech) to work.
- Reminded me of the [Low Tech Magazine][7].
- Introduced me to the idea of Solarpunk - as a Cyberpunk derivative.

> A wobbly wooden chair built by a friend beats any designer chair.

Websites/web apps built around static web pages (like this blog) are a great example of "Cheap Web".

I believe web will be better off if we focus on removing unnecessary bloat (JS libraries, complex architecture etc) from our software; not by adding new features. Less is More!

#### [CodeSandbox: How we clone a running VM in 2 seconds][8]

Amazing engineering work here!

Two key technologies leveraged here:
- [Firecracker][9], in particular microVMs.
- [Copy-on-Write][10] resource management technique.

The concept of memory snapshotting is elaborately described.
More so, I found the deep dive into the engineering work to put the pieces together very inspiring.

I need to study and read up about Firecracker and the concept of KVM.
Let me know if you have any good resources for this.

#### [Andrew Ng: AI's Instagram Problem][11]

> Judge your projects according to your own standard, and don’t let the shiny objects make you doubt the worth of your work!

I think of 2 things when I read this article:
- FOMO due to the latest fashionable trend is not worth it. I have read and realised it through Taleb's writings as well.
- One of the most important characteristics of the 21st century (atleast my generation) is the ability to learn, adapt and relearn new skills; especially my skillsets a tech worker.

---

### December 20

#### [Steve Yegge - Math for Programmers][12]

One of the most inspiring articles to study mathematics, especially as a full-time programmer aka Liberal Arts degreee in Mathematics.

> Math is almost always about formalizing our "common sense" about some domain, so that we can deduce and/or prove new things about that domain.

This is a such a powerful perspective to approach mathematics.
For example, Formal Methods are mathematically techniques related to software systems (analysis, verification etc).
Another example could be the real-life problems with travelling across cities resulting in the field of Graph Theory. (Travelling salesman problem).

> the math that you'll find useful is pretty different from the math your school thought would be useful.

Based on my experience as a Math graduate, I can attest to this.

Think of learning math as a hobby more than anything.

---

### December 23

#### [Ethan Zuckerman: How Big Is YouTube][13]

I don't see a lot of talk about the "denominator problem".
This article does a great job at providing context to the discussion of normalizing data.
It's not too difficult to skew most datasets to fit our viewpoint.
As a undergrad student, I had shared in this guilty pleasure too.
And I would not be surprised if a similar practice exists in some of the industry.
Not that it's anybody's fault, I belive it's just part of our nature.

Anyways, I really appreciate Ethan sharing the process here.
The linked articles about building URLs for YouTube can be valuable from engineering PoV.
Thanks for Tubestats as well.

> I believe that high level data like this should be published regularly for all large user-generated media platforms. These platforms are some of the most important parts of our digital public sphere, and we need far more information about what’s on them, who creates this content and who it reaches.

#### [Elicit: Build a search engine, not a vector DB][14]

Really interesting take on the problem of knowledge discovery.

Full-text search still remains a challenging problem.
At the same time, the increasing popularity of vector DBs, in particular, the embeddings data structure, provide another approach to the fundamental problem. A conjugation of both of these technologies can be used to build a valuable solution.

However, questions around the efficiency of such a solution remains to be tested and monitored.

---

### December 24

#### [Bill Watterson: Some Thoughts On The Real World By One Who Glimpsed It And Fled][15]

Such an excellent read!
I am more curious to read about Bill Watterson.

> Despite the futility of the whole episode, my fondest memories of college are times like these, where things were done out of some inexplicable inner imperative, rather than because the work was demanded.

> It's surprising how hard we'll work when the work is done just for ourselves.

The conventional "utility" of a piece of work is independent of our ability to relish the effort.
While we cannot always decide on the value for the world, we can choose what an experience meant to us personally.

> We're not really taught how to recreate constructively. We need to do more than find diversions; we need to restore and expand ourselves. Our idea of relaxing is all too often to plop down in front of the television set and let its pandering idiocy liquefy our brains. Shutting off the thought process is not rejuvenating; the mind is like a car battery-it recharges by running.

In the world of sports, we use the term "active recovery" for this.
Active recovery involves low-effort activities to complement a workout.
For example, walking and mobility (yoga, stretching) after running.
Reading this passage, I sense the skill/art of "active recovery" is more broadly applicable.

> Letting your mind play is the best way to solve problems. A playful mind is inquisitive, and learning is fun. If you indulge your natural curiosity and retain a sense of fun in new experience, I think you'll find it functions as a sort of shock absorber for the bumpy road ahead.

"Be curious, not judgemental".
The endurance demanded for pursuing one's genuine curiousity can be robust.
Rest all will fall apart with time (or entropy).

> It was a rude shock to see just how empty and robotic life can be when you don't care about what you're doing, and the only reason you're there is to pay the bills.

> You will do well to cultivate the resources in yourself that bring you happiness outside of success or failure.

I see some value in detaching my personal notion of "happiness" from the metric of "success" (atleast the society's definition of "success").

> The truth is, most of us discover where we are headed when we arrive. At that time, we turn around and say, yes, this is obviously where I was going all along. It's a good idea to try to enjoy the scenery on the detours, because you'll probably take a few.

This reminds me a lot of Camino de Santiago trip with my friends. Yes, absolutely agree and try to lead my life this Way.

> Drawing comic strips for five years without pay drove home the point that the fun of cartooning wasn't in the money; it was in the work.

Very interesting!

> We all have different desires and needs, but if we don't discover what we want from ourselves and what we stand for, we will live passively and unfulfilled. Sooner or later, we are all asked to compromise ourselves and the things we care about. We define ourselves by our actions. With each decision, we tell ourselves and the world who we are. Think about what you want out of this life, and recognize that there are many kinds of success.

This hits home. I have had a strong belief in something similar. It's good to read it written down in words.

> Your preparation for the real world is not in the answers you've learned, but in the questions you've learned how to ask yourself.

Reminds me of one of Rilke's famous passage:

“Be patient toward all that is unsolved in your heart and try to love the questions themselves, like locked rooms and like books that are now written in a very foreign tongue. Do not now seek the answers, which cannot be given you because you would not be able to live them. And the point is, to live everything. Live the questions now. Perhaps you will then gradually, without noticing it, live along some distant day into the answer.”

---

### December 28

#### [Donald Knuth: Ancient Babylonian Algorithms][16]

This is such an intriguing paper on the history of computing, hence mathematics.
I highly recommend reading it yourself.

Few notes from the paper:
- Question: How is computer science connected with the human history further beyond the developments in the last century?
- Base 60 system instead of Base 10 for mathematics.
- Pergamonmusuem in Berlin houses a part of one of the clay tablets from Mesopotamia. I would have liked to see it but the museum is closed for renovations (for 14 years). So I guess I need to wait a bit longer.
- Babylonian procedures are genuine algorithms. "This is the procedure."
- Neither conditionals not iterations were used in the procedures. Almost everything was "known" - via lookup tables, or some algebra.
- Excellent examples that remind me of my middle school algebra. Just to wonder the advancements we have made in terms of technical sophistication.
- Inakibit-Anu was the first man in history to solve a computational problem that takes longer than 1 second of time on a modern electronic computer.
- Euclid's Algorithm is one of the oldest algorithms. I need to read more about it. However, I remember implementing it as part of [Advent of Code 2023 challenges][17].

---

### December 29

#### [Flamed Fury: Relics of Web][18]

Linking content on the web is a superpower.
A superpower that is easy to overlook.

The web is inherently designed for ease of discovery (through links).
At the same time, the relevancy is a burden for the individual to resolve.
We do not need any centralised service to curate a personalised experience for us.
Yet, in reality the situation is quite different.

This post provides a lot of context around web-native ideas to improve the process of discovery and relevancy.

I'm definitely going to curate a blogroll here soon.

[1]: https://aphyr.com/posts/367-why-is-jepsen-written-in-clojure
[2]: https://aphyr.com/posts/301-clojure-from-the-ground-up-first-principles
[3]: https://aphyr.com/posts/302-clojure-from-the-ground-up-basic-types
[4]: https://aphyr.com/posts/303-clojure-from-the-ground-up-functions
[5]: http://norvig.com/21-days.html
[6]: https://potato.cheap/
[7]: https://solar.lowtechmagazine.com/
[8]: https://codesandbox.io/blog/how-we-clone-a-running-vm-in-2-seconds
[9]: https://firecracker-microvm.github.io/
[10]: https://en.wikipedia.org/wiki/Copy-on-write?useskin=vector
[11]: https://web.archive.org/web/20230924131456/https://www.deeplearning.ai/the-batch/someone-elses-cool-ai-project-doesnt-make-your-project-less-valuable/
[12]: https://steve-yegge.blogspot.com/2006/03/math-for-programmers.html
[13]: https://ethanzuckerman.com/2023/12/22/how-big-is-youtube/
[14]: https://blog.elicit.com/search-vs-vector-db/
[15]: https://web.mit.edu/jmorzins/www/C-H-speech.html
[16]: https://fermatslibrary.com/p/06445717
[17]: https://github.com/kshitij10496/aoc/blob/4c1592d3c41dc89f0c78a19800b29ff93cfe6e34/src/aoc/2023/day08.clj#L79-L82
[18]: https://flamedfury.com/posts/relics-of-the-web/
