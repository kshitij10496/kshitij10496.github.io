---
title: "Encoding the Python Source Code File"
date: 2017-09-02T14:42:53+01:00
draft: false

slug: "encoding-python-source-file"
tags: ["python", "encoding", "file", "unicode", "utf-8"]
categories: []
---

There are about 15 million lines of Python code starting with a variant of the form: `# -*- coding:<some encoding> -*-` hosted on GitHub. To any person learning Python, this might seem as another single-line “comment”. It sure did look that way to me when I started out programming in Python. However, I soon realized that there is something mysterious and esoteric about it. It was some kind of *special comment* which was being used by every Python developer across codebases. In this article, I will try to break down the concepts behind this line of code.

# Our Toolkit

**ASCII**: A character set to represent every good old unaccented English letter in memory using a number between 32 and 127. The letter “A” is represented by 65 while 32 represents a “Space”.

**Unicode**: Unicode was a brave effort to create a single character set that included every reasonable writing system on the planet and some make-believe ones like Klingon, too. In Unicode, a letter maps to something called a *code point*, which is still just a theoretical concept.

**UTF-8**: It is an encoding which deals with the problem of storing the characters in memory. In UTF-8, every code point from 0–127 is stored in a single byte. Only code points 128 and above are stored using 2, 3, in fact, up to 6 bytes. This has the neat side effect that English text looks exactly the same in UTF-8 as it did in ASCII.

> It does not make sense to have a string without knowing what encoding it uses. — Joel Spolsky

**tl;dr** — If you have a string, in memory or in a file, you have to know what encoding it is in or you cannot interpret it or display it to users correctly.

# Source Code File Encodings

Whenever you need to type any non-ASCII character while defining literals, that is, a character which cannot be represented through an ASCII code
(e.g. accented English alphabet, Greek symbols), the Python interpreter does not know the encoding to use in order to represent this character. Thus, defining an encoding enhances the interpretation of Unicode literals in the source code and makes it possible to write Unicode literals using e.g. UTF-8 directly in an Unicode aware editor. This is where our *special comment* comes into picture!

> If a comment in the first or second line of the Python script matches the regular expression `coding[=:]\s*([-\w.]+)`, this comment is processed as an **encoding declaration**; the first group of this expression names the encoding of the source code file. The encoding declaration must appear on a line of its own. If it is the second line, the first line must also be a comment-only line.

Thus, all the variations of the encoding statement are valid as long as the regular expression matches. Refer [PEP 263](https://peps.python.org/pep-0263/) for examples.

**NOTE**: From Python 3.0, if no encoding declaration is found, the default encoding is UTF-8.

# Enough Talk, Show Me Code

{{< gist kshitij10496 e6ce35c04533b340658004399953199b>}}

We will use some variations of the code in the above file to understand the importance of the encoding in files. So, I would suggest you copy and save this Python file somewhere. Perform the following experiments, and try to reason your observations.

1. Run this file using Python2 interpreter.
2. Run this file using Python3 interpreter.
3. Remove L01(read Line 1). Run the updated file using Python2 interpreter.
4. Remove L01(read Line 1). Run the updated file using Python3 interpreter.

## Observations

1. Experiment 01: The *code point* for the non-ASCII characters in the “representation” of the unicode strings.
2. Experiment 02: [Reason](https://stackoverflow.com/questions/26125141/str-object-has-no-attribute-decode-in-python-3/26125214#26125214) for the `AttributeError`.
  Bonus: Modify L03 using `encode` instead of `decode` and execute the file.
3. Experiment 03: Seems reasonable, doesn’t it?
4. Experiment 04: Aren’t all the observations identical to those from Experiment 02?

If you still are facing trouble understanding the observations or I may have skipped any significant observation, let me know in the comments.

# Lessons Learnt

- If you intend to write only Python3 specific code using the UTF-8 encoding, you need not use this line.
- In all other cases, it is recommended to mention an encoding at the top of your Python files. This has two advantages:
  1. Being explicit in your code
  2. Compatibility across Python2 and Python3

# References

- [PEP 263](https://peps.python.org/pep-0263/)
- [PEP 3120](https://peps.python.org/pep-3120/)
- [The Absolute Minimum Every Software Developer Absolutely, Positively Must Know About Unicode and Character Sets(No Excuses!)](https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/)
