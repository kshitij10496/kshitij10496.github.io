---
title: "Windows Tiling on macOS"
date: 2025-03-27T18:40:17+01:00
draft: false

slug: "macos-windows-tiling"
tags: []
categories: []
---

macOS Sequoia introduced [native tiling window support][1]. This feature aims to make it easy to arrange open windows into a structured layout - a problem already solved in Linux and Windows world. Until recently, I relied on third-party tools like [Magnet][2], and [Rectangle][3] to manage windows on my machines.

Currently, I use the native tiling window management (with the built-in keyboard shortcuts) supplemented by Rectangle.

## Almost Maximize

Rectangle offers a window tile size called "Almost Maximize". It allows you to resize the window to 90% of the screen, leaving a small, padded border around the windows[^1]. This is particularly handy for applications like web browsers, terminal emulators. Surprisingly, I almost always use the "Almost Maximize" in favor of both the regular full screen and the "Center Window".

## Multiple Window Tiling

The macOS native tiling window management offers a few window layouts to arrange multiple windows. This feature is particularly useful for applications like IDEs, terminals, and other tools that require multiple windows to be open simultaneously. I use it extensively for my development workflow.

Overall, I find the native tiling window management to be a powerful tool that enhances my personal productivity. But the tooling is a bit cumbersome for the time being.

[1]: https://support.apple.com/en-gb/guide/mac-help/mchlef287e5d/15.0/mac/15.0
[2]: https://magnet.crowdcafe.com/
[3]: https://rectangleapp.com/

[^1]: [Rectangle - Terminal Commands]( https://github.com/rxhanson/Rectangle/blob/main/TerminalCommands.md#almost-maximize)
