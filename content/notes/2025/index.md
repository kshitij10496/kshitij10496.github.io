---
title: "2025"
date: 2025-01-01T00:00:00+02:00
draft: false

slug: "2025"
tags: []
categories: []
---

### July 24

#### [Agentic Engineering | Zed][3]

This series by Zed Industries is worth following.
I really enjoyed the [episode with Mitchell Hashimoto][4] about his appraoch to using AI Agents while developing software systems. Key takeways include:
- Thinking more like an architect.
- Allow AI Agents to use tools to achieve the desired outcome.
- Comment what the code implementation as a way to build redundancy (AI can flag any discrepancies now)

And I look forward to Steve Yegge's episode next.

### April 3

#### [Why I Maintain a 17 Year Old Thinkpad][2]

In general, I find physical artifacts to be almost always fragile to the effects of time (including plastic). Thus, I don't feel comfortable about discussing the notion of anti-fragility in the context of laptops. However, the argument to differentiate between Thinkpads and Macbooks in terms of longevity, and repairability is appealing. Especially considering that I have never owned a Thinkpad, and recently bought a couple of new Macbooks.

### March 25

#### [Sorting Go Slices][1]

This article makes a strong case for using the "generic" implementation (provided by the `slices` package) for sorting slices in Go.
I have used the `sort.Interface` interface as well as the `sort.Slice` function to sort slices. For precisely the same reasons listed in the post, I have never felt comfortable with either of them. The next time I need to sort a slice, I will make sure to give the `slices.Sort` function a try.

[1]: https://rednafi.com/go/sort_slice/
[2]: https://pilledtexts.com/why-i-use-a-17-year-old-thinkpad/
[3]: https://zed.dev/agentic-engineering#leverage
[4]: https://www.youtube.com/watch?v=XyQ4ZTS5dGw
