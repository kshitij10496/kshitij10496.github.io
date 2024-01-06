---
title: "Signing Git Commits"
date: 2024-01-06T16:13:12+01:00
draft: false

slug: "signing-git-commits" 
tags: ["git", "ssh"]
categories: []
---

Whenever I setup a new machine, the following Git commands are a staple:

```shell
git config user.name "Your Name"
git config user.email "your.email@domain.ext"
```

I have always wondered what's preventing a person from impersonating somebody other than themselves.

This curiousity led me to learning about Signatures, especially how to configure them on Git.
In particular, I was interested in setting up my machine to sign via my work and personal identities.

The solution to the generic problem of identification (authentication) is addressed with the concept of "digital signature". Usually, we can implement via public key cryptography.

## SSH Key Signatures

I already use SSH to authenticate with GitHub while working with repositories - cloning repos, fetching and pushing branches. Hence, I would also like to use the same SSH mechanism to sign commits.

## Timeline

- 2008 : Launch of GitHub.  
- 2012 : Git supports signing commits via GPG.  
- 2016 : GitHub supports signature verification via GPG.
- 2019 : OpenSSH supports signing and verification on arbitrary data.
- 2021 : Git supports signing commits via SSH keys.
- 2022 : GitHub supports signature verification via SSH keys.

It has been a 14 year long journey to reach a point where we can easily sign Git commits with SSH.

## Process

The steps to authenticate and sign commits with SSH is well documented for [GitHub](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification#ssh-commit-signature-verification) and [GitLab](https://docs.gitlab.com/ee/user/project/repository/signed_commits/ssh.html).

## Conclusion

It's still open for discussion whether to use the same SSH key for both authentication and signing commits or not.
Regardless, the idea of signing commits in a code repository is an easy, valuable security measure.

I strongly recommend signing commits with SSH wherever possible.
