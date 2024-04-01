+++
draft = false
date = 2018-09-09T19:03:31+05:30
title = "Hugo Blog On GitHub Pages"
slug = "hugo-blog-setup"
tags = ["Hugo", "git", "GitHub"]
categories = ["Setup", "Blog"]
+++

Update: I have published an updated [blogging setup in 2024](https://kshitij10496.github.io/posts/blog-setup/). Thus, the content of this post is not entirely accurate anymore.

**Looking to create your personal blog using Hugo and hosting it on GitHub Pages?**  

To be honest, it can sound a bit intimidating and challenging at first.  
I, too, felt the same while I setup *this* blog using Hugo and the Coder theme.  
In this post, I share my experience during the process - from the specific commands to the lessons learnt.  
In addition to this, I also share my workflow for publishing posts using a shell script.  

### Requirements
- OS: macOS, Ubuntu - the steps can easily extend to other Unix-based OS i.e. No *Windows* (sorry, not sorry)
- Terminal + Shell - for executing all the commands
- Hugo (Read: [Installation](https://gohugo.io/getting-started/installing/))
- Git (Read: [Installation](https://www.atlassian.com/git/tutorials/install-git))
- Text Editor - to write blog content (I prefer [Visual Studio Code](https://code.visualstudio.com/download))
- Web Browser - for accessing GitHub and selecting themes

By the end of the post, you should have a blog, with at least one post, up and running on GitHub Pages.  
Let's dive in!

## Hugo

#### Step 1: Create a basic Hugo site
1. Open up the terminal.
2. Navigate to the directory where you want to store the blog locally.
3. Create a new hugo site: ```$ hugo new site blog```
4. Change to the newly created `blog` directory: ```$ cd blog```

#### Step 2: Setup GitHub and Git locally
*(Working directory: `blog`)*

##### GitHub
1. Create a new repository on GitHub naming it as `<your-github-username>.github.io`
(`kshitij10496.github.io`, in my case).

##### Git
1. Initialise the `blog` directory with Git: `$ git init`
2. Add the `$ git submodule add https://github.com/<username>/<username>.github.io public`
3. A new `public` folder should be created within the `blog` directory.
4. Choose a Hugo Theme for your blog from [here](https://themes.gohugo.io/)
5. Add the theme as another Git submodule: `$ git submodule add <theme-git-url> themes/<themeName>`  
Ex: For the `coder` theme, use: `$ git submodule add https://github.com/luiz/coder themes/coder`

**LESSON:** Using `git submodules` empowers us to specify theme version for our blog and reduce the code duplication and maintenance.

**NOTE:** This is one of the most important *hence* confusing, step of the entire process.    
*We have to deal with atleast **2** separate Git repositories in the same directory.*

We will track the final statically generated website in the `public` sub-directory and host it on GitHub. 
Ideally, this would contain the final HTML and CSS files. The `blog` directory should contain the Markdown content, 
static images and configuration files relevant to Hugo.

**BONUS:** It's your choice whether you want to publish this repo to GitHub or not. Personally, I pushed mine to [`hugo-blog`](https://github.com/kshitij10496/hugo-blog).

#### Step 3: Creating Content
*(Working directory: `blog`)*

1. Customise the `config.toml` file according to your needs. Refer: [Sample](https://gist.github.com/kshitij10496/1f6801be9c2e1d2e1ea9855b18b0bd82#file-config-toml)
2. Create a new content file: `$ hugo new posts/hello-world.md`
3. A new markdown file named `hello-world.md` is created in `content/posts` directory with some metadata.
4. Write your heart out! :love:
5. Preview the website with the newly created draft `$ hugo serve -D`
6. Navigate to your new site at `http://localhost:1313/` (most probably).
7. When you are happy with your post, set the `draft` header in the file to `false`.
8. Generate the final static website: `$ hugo`
9.  Move to `public` directory and you will notice many newly created HTML/CSS files aka "Your Blog".

The blog is all ready to be the next viral thing on the internet! :sunglasses:  
In the next step, we commit the changes and push the `public` folder to GitHub.

#### Step 4: Workflow for Publishing Content
*(Working directory: `blog/public`)*

1. Staging the changes made: `$ git add .`
2. Commiting the changes: `$ git commit -m "<your-commit-message>"`
3. Pushing to GitHub repo: `$ git push origin master`
4. Enter your GitHub credentials when/if prompted.
5. Your blog should be up and running on `https://<your-github-username>.github.io` within a couple of minutes.
6. Congratulations! You made it. :clap:

**BONUS:** I have created a [deploy.sh](https://gist.github.com/kshitij10496/7f1130979cae450ed0812cbd9d8dd7f4#file-deploy-sh) shell script which abstracts the above commands. You can download it and place it in the `blog` directory. 

**NOTE:** In general, commiting directly to `master` is not a recommended Git practice. Git branches are the way to go.
However, I'm suggesting direct manipulation of the `master` branch primarily because this is a personal blog.
Be careful with this!

# Creating new content

Now that you have setup your blog, creating new posts is a breeze!  
You simply need to follow the method mentioned in **Step 3** and **Step 4** from above.  
Pretty clean, isn't it?

# Final Thoughts

I hope this post will help you get started with adopting Hugo for your static site needs and hosting it on GitHub should now be easy.
There are a lot of customisations which I'm still exploring and discovering everytime I publish something.
You can take a look at my [config.toml](https://github.com/kshitij10496/hugo-blog/blob/master/config.toml) file for this blog as a reference.

In case you have any queries/face issues with the above-mentioned process, don't be afraid to ask in the comments section below.  

Cheers! :beer: