---
title: "How to Write Better Git Commit Messages"
description: "Learn the importance of well-crafted Git commit messages and discover whether simple or detailed commit messages are right for your projects. Explore various commit message styles and best practices to enhance collaboration and codebase documentation."
tags: ["Git"]
date: 2023-09-15T09:03:30+0800
thumbnail: https://www.aviator.co/blog/wp-content/uploads/2023/01/git-commit.png
lastmod: 2023-09-16T11:25:30+0800
---

## Introduction

Git commit messages play a pivotal role in the version control process. They serve as a historical record of changes made to a project, aiding developers in understanding why specific changes were made and how they contribute to the overall development process. In this blog post, we'll delve into the significance of well-crafted commit messages and provide guidance on how to enhance them. We'll also explore the decision between keeping commit messages simple or providing more detail, along with different commit message styles.

## The Importance of Good Commit Messages

Before we delve into the intricacies of commit message styles, let's first establish why writing good commit messages is a crucial practice:

### 1. Clarity and Understanding

A well-composed commit message should be clear and concise, enabling anyone who reads it to grasp the purpose of the change. This clarity is especially vital in team environments, where it helps colleagues quickly comprehend the context of a change.

### 2. Troubleshooting and Debugging

When issues arise in your code, having the ability to trace changes back to their respective commit messages is invaluable. A well-structured commit message can significantly streamline the debugging and problem-solving processes.

### 3. Historical Documentation

Commit messages serve as a historical record of your project's development journey. They provide insights into why specific decisions were made and illuminate how the codebase evolved over time.

### 4. Code Review and Collaboration

During code reviews, clear commit messages foster productive discussions. They enable reviewers to understand the intent behind your changes, facilitating more meaningful feedback and collaboration.

## Simple vs. Detailed Commit Messages

Now that we recognize the importance of good commit messages, let's address the question of whether your commit messages should be simple or detailed. The choice often hinges on the context and the nature of the change:

### Simple Commit Messages

Simple commit messages are concise and to the point. They usually consist of a single line (the subject) and are suitable for minor, self-explanatory changes such as bug fixes or minor improvements. Here are some examples:

- "Fix typo in README"
- "Update dependencies"
- "Refactor CSS styling"

Simple commit messages excel in cases where changes are straightforward and don't require extensive explanations. Nevertheless, they might lack context for more intricate changes.

### Detailed Commit Messages

Detailed commit messages, on the other hand, provide a more comprehensive description of the change. They consist of a subject line and an optional body. This style is preferable for substantial changes, new features, or complex bug fixes. Here's an example of a detailed commit message:

```plaintext
feat(auth): Implement user authentication feature

- Implement user login and registration functionality.
- Use bcrypt for password hashing.
- Include user profile management.
- Add tests for authentication endpoints.
```

Detailed commit messages furnish a clear understanding of the change's scope, rationale, and implementation details. They shine when the change demands context or when multiple individuals collaborate on a project.

### Provide Context in the Body

If your commit message necessitates additional context, you can utilize the commit message body to elucidate the reasoning behind the change, potential side effects, or any other pertinent details.

## Commit Message Styles

Now that we've explored the simple vs. detailed approach, let's delve into different commit message styles that can help elevate your commit messages:

### 1. Conventional Commit Messages

Conventional commit messages follow a structured format: `<type>(<scope>): <message>`. This format is widely adopted, particularly in open-source projects. Here's an example:

```shell
feat(auth): Implement user authentication
```

- `<type>` describes the purpose of the commit (e.g., feat for a new feature, fix for a bug fix).
- `<scope>` (optional) specifies the module or component affected.
- `<message>` offers a concise summary of the change.

Conventional commit messages streamline tasks like version bumping and changelog generation.

### 2. Imperative Mood

Writing your commit messages in the imperative mood, as if you're issuing a command, adds clarity and action-orientation to your messages. For instance:

- "Add user profile editing functionality" instead of "Added user profile editing functionality."
- "Fix login page validation bug" instead of "Fixed login page validation bug."

Commit messages in the imperative mood are more concise and align well with conventional commit message practices.

### 3. Use Proper Capitalization and Punctuation

Ensure that your commit messages are well-formatted, with proper capitalization and punctuation. Consistency in style enhances readability and professionalism.

## Examples of Common Commit Messages

To further illustrate the principles of effective commit messages, let's take a look at some examples for various common scenarios:

### 1. Updating Documentation

The following is an example of updating the Linux documentation (README.md)

```plain
docs: Update installation guide for Linux

In this commit, we're updating documentation related to the installation guide specifically for Linux.

- Using the 'docs' prefix clarifies the nature of the change.
```

### 2. Fixing a Typo

Here is an example of fixing documentation typos in the user manual

```plain
docs: Fix typo in user manual

This commit addresses a straightforward issue — a typographical error in the user manual. A simple, clear message is sufficient for such changes.
```

### 3. Adding a New Functionality

Here is an example of adding a new feature 2fa

```plain
feat(auth): Implement two-factor authentication
```

### 4. Adding a New Markdown Blog Post

Here is an exmple of adding a new blog post

```plain
docs(blog): Add 'How-to-Write-Better-Commit-Messages.md' blog post

In this case, we're adding a new Markdown blog post to the documentation
```

These examples showcase how commit messages can effectively convey the nature of changes, whether they are documentation updates, bug fixes, new features, or additions to the project's content.

## Conclusion

Enhancing your Git commit messages is a small yet significant stride toward maintaining a well-organized and collaborative codebase. Whether you choose simple or detailed commit messages, adhering to best practices and adopting a consistent style will benefit both you and your team. Clear commit messages streamline code review processes, simplify debugging, and serve as valuable documentation for your project's evolution. The next time you commit your code changes, take a moment to craft a message that narrates your development journey.