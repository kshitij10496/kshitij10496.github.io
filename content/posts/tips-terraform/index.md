---
title: "Tips for working with Terraform as a developer"
date: 2023-03-30T14:29:46+02:00
draft: false

slug: "tips-terraform"
tags: ["terraform"]
---

At work lately, I have been working with Terraform for our Infrastructure-as-code.
My limited domain expertise lies primarily within the scope of backend systems.
I had never worked with provisioning infrastructure via code before.
So it was a valuable experience to see code turn on machines to execute more code.

Here are a few things I learnt during the process:

1. Use `tfswitch` for dependency management to install and toggle between the various Terraform versions used across the modules.
2. Always use `terraform init --upgrade` to never use cached modules. This saves a lot of potential trouble shooting at the cost of few seconds.
3. Use `terraform plan -var='key:value'` whenever we have to use variables (for example, passwords).
