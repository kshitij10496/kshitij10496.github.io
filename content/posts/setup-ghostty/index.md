---
title: "Setup Ghostty"
date: 2025-01-08T20:15:25+01:00
draft: false

slug: "setup-ghostty"
tags: ["ghostty"]
categories: []
---

I switched my terminal from Warp to Ghostty over the weekend.
I had been using Warp for almost a couple of years now and it has been great.
But I wanted to try something new and Ghostty seemed like a good option.
I have been using it for a few days now, and I really enjoy the experience so far.

The default configuration of Ghostty is pretty good.
However, I made a few changes to adapt it to my muscle memory.

- **Font Size**: Increased to 16px.
- **Theme**: Changed to *Dracula+*.
- **Keybindings**(macOS specific): Allow CMD + Backspace to delete the current line buffer.

Here is the current configuration of Ghostty:

```
# Increase the default font size.
font-size = 18

# Allow CMD + Backspace to delete the current line buffer (like Warp).
keybind = cmd+backspace=esc:w

# ZSH Shell
shell-integration = zsh

# Theme
theme = Dracula+
```

I will keep using Ghostty for a few more days and see how it goes.
