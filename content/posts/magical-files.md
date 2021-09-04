+++ 
date = 2019-02-10T18:55:02+05:30
title = "Magical Files"
description = ""
slug = "magical-files" 
tags = ["unix", "osx", "linux"]
categories = ["Project", "Software"]
externalLink = ""
+++


# Context

My `Downloads` folder is a mess!

I have got hundreds of files in that directory. Most of them are PDF documents with some images, archives and disk images.

“Is there a way to only list all the PDF files present in a directory?”

Well, filtering based on file extension (`.pdf`) should be able to do this for me. Moreover, I can leverage the power of regular expression: `$ ls -lh ~/Downloads/*.pdf`

After some experimentation, I discovered that a non-negligible number of files stored in PDF format existed which did not have a `.pdf` extension 😱:

1. The university’s portal only allows us to download PDFs with a `.jsp` extension. 😓
2. I had a `FileHandler.ashx` file that also contained data in PDF format.

These findings helped me infer that the use of `*.pdf` RegEx is not robust enough to ensure that all PDF documents are selected. Apparently, even the OSX’s Finder fails at detecting the file “Kind” for `FileHandler.ashx`.

Finder

Looking for something more sophisticated, eh?

# Detour: Magic Numbers ✨

What is a **magic number**?  
Any constant numerical or text value that you find in your code is a magic number, especially the ones you “forget” to comment/document.

Interestingly enough, many files have such constants that identify the contained data. In addition to this, detecting such constants in files is a simple and effective way of distinguishing between many file formats. 😲 These magic numbers, used to identify or verify the content of a file, are also called “file signatures”.

Examples:

1. PDF documents begin with `%PDF` text - the corresponding magic number for this format.
2. Shebang (`!/usr/bin/sh`) line in script files is a human readable file signature.
3. `<!DOCTYPE HTML>` indicate HTML documents.

**caution ⚠️:**

The magic number approach offers better guarantees that the format will be identified correctly, and can often determine more precise information about the file.

1. Since reasonably reliable “magic number” tests can be fairly complex, and each file must effectively be tested against every possibility in the magic database, this approach is relatively inefficient, especially for displaying large lists of files.
2. Also, data must be read from the file itself, increasing latency as opposed to metadata stored in the directory.
3. Where file types don’t lend themselves to recognition in this way, the system must fall back to metadata.

**green light ✅:**

Failing a well-designed magic number test is a pretty sure sign that the file is either **corrupt** or of the **wrong type**. On the other hand, a valid magic number does not guarantee that the file is not corrupt or is of a correct type.

# Preliminary Research

I have previously used the Unix `file` command for determining the file type by performing some “tests” via system calls. One of them is the **magic test** which checks the file header for the existence of these magic numbers using the `libmagic` library written in C.

The next question confronting me: “Is there a way to use the libmagic library from Go?”

That’s when I found the [rakyll/magicmime](https://github.com/rakyll/magicmime) package from the inimitable JBD. 🎉
It provides Go bindings for the `libmagic` library - exactly what I was looking for! 😁

# Solution

This week I will be developing a CLI using [spf13/cobra](https://github.com/spf13/cobra) which can help the users filter files based on it’s format. My intention is to make a simple, decoupled and UNIX pipe compatible tool that plays well with other utilities. With my university exams starting in 10 days, this week would be the optimal period for me to work on the project.

In case there are any existing solutions for solving this, do let me know!  
If you currently experience this problem, I would love to hear your thoughts. 😃

# References

1. [Magic number](https://en.wikipedia.org/wiki/Magic_number_(programming))
2. [file command](https://en.wikipedia.org/wiki/File_(command))
3. [File format](https://en.wikipedia.org/wiki/File_format)
4. [List of file signatures](https://en.wikipedia.org/wiki/List_of_file_signatures)
