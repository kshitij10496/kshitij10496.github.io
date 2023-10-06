---
title: "GitHub Copilot Slogs and Misses"
date: 2023-08-18T11:28:59+02:00
draft: true

slug: "copilot-slog" 
tags: []
categories: []
---

# Outline

- Provide background about my usage of copilot
    - I have been using Copilot for a couple of months to write production code.
    - Fairly happy with the tool.
    - Apart from code, my style of working and approaching problems has changed - nothing feels out of bound (for example, frontend code, infrastructure)
    - A sense of excitement about a new challenge rather than apprehension with unfamiliar tech.
- Problem Motivation
    - Go 1.21 introduced a new package for structured logging called "slog".
    - I wanted to port 1 of my existing applications to use slog instead of third-party library.
    - Part of the challenge is to learn about the new package.
    - Assisted by copilot, I felt the possibilities.
- Problem Details
    - Copilot fails to cope with the challenge.
    - It fails to even recognize the correct import path for the package.
    - The suggestions are all off.
    - The dev experience was so bad I felt much comfortable referring back to the official documentation (and blogs) and writing the code myself.
- Conclusion
    - AI programming tools are perhaps not well equipped for experimentation.
    - It not the fault of the tool, I believe it's not the problem space they are built to address.
    - Good learning for me.
