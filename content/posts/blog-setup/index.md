---
title: "Hugo Blog Setup with GitHub Pages"
date: 2024-04-01T16:42:00+02:00
draft: false

slug: "blog-setup" 
tags: ["Hugo", "git", "GitHub"]
categories: ["Setup", "Blog"]
---

Back in 2018, I had written about my [Blog Setup](https://kshitij10496.github.io/posts/hugo-blog-setup/).  
That process worked well so far.  
Though it was not ideal, as the deployment process required quite a bit of manual work.  
Thus, I always knew at the back of my head to revisit the setup and make it a bit more efficient.

I have something simpler now using automation via GitHub Actions.

----

# Setup

1. Push the Hugo framework specific content to the `master` branch on the [`kshitij10496.github.io` repository](https://github.com/kshitij10496/kshitij10496.github.io).
2. Creating a GitHub Actions workflow[^1] for CI/CD of any changes to the `master` branch.
    - Make sure to specify the correct "branches" in the workflow.
    - You will have to add themes as Git Submodules to the repo.
3. Configuring the **Repository Settings** to use the use the newly created GitHub Action instead of the default Jekyll-based Action provided by GitHub.[^2]

Voila!

# Result
As soon as I write a piece of content - save, commit and push - on the `master` branch, it is automically published to my blog.

# Conclusion
It took me some time to figure out the details due to lack of consolidated documentation about working with this tech stack. This setup can be easily tuned to create a project specific Pages as well.  
Hopefully, this post helps if you are considering to use Hugo with GitHub Pages to publish your static sites.

[^1]: [GitHub Actions workflow](https://github.com/kshitij10496/kshitij10496.github.io/blob/303caf83b68275f55f46a70e160cc4994c92aabf/.github/workflows/hugo.yml)
[^2]: [GitHub - Publishing with a custom GitHub Actions workflow](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site#publishing-with-a-custom-github-actions-workflow)