# Git & GitHub setup on Debian  
## *This is document has detailed instruction of how to setup and use git a GitHub.*

```markdown
# Git Commands and Explanations

This document provides a comprehensive guide to commonly used Git commands along with explanations of what each command does.

## Setup

### Install Git

```bash
sudo apt install git
```

- Installs Git on Debian-based systems using the apt package manager.

### Configure Git

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

- Sets up your name and email address globally for Git commits.

```bash
git config --global init.defaultBranch main
```

- Configures Git to use 'main' as the default branch name.

## Basic Commands

### Initialize a Repository

```bash
git init
```

- Creates a new Git repository in the current directory.

### Clone a Repository

```bash
git clone <repository_url>
```

- Clones an existing repository from a remote URL.

### Stage Changes

```bash
git add <file_name>
```

- Stages changes in a file for the next commit.

### Commit Changes

```bash
git commit -m "Commit message"
```

- Commits staged changes to the repository with a commit message.

### View Status

```bash
git status
```

- Displays the current status of the repository, including changes.

### View Commit History

```bash
git log
```

- Displays the commit history of the repository.

## Branching

### Create a New Branch

```bash
git branch <branch_name>
```

- Creates a new branch with the specified name based on the current branch.

### Switch Branches

```bash
git checkout <branch_name>
```

- Switches to the specified branch.

### Merge Branches

```bash
git merge <branch_name>
```

- Merges changes from the specified branch into the current branch.

###Delete a Branch

```bash
git branch -d <branch_name>
```

- Deletes the specified branch (locally).

# Remote Operations

## Add a Remote

To add a remote repository to your local Git setup, follow these steps:

1. Open your terminal.
2. Navigate to your local Git repository directory using the `cd` command.
3. Execute the following command, replacing `<remote_name>` with a name you choose for the remote (usually `origin` for the main repository) and `<repository_url>` with the URL of the remote repository you want to link to:

    ```bash
    git remote add <remote_name> <repository_url>
    ```

4. Verify that the remote has been added successfully by using the following command:

    ```bash
    git remote -v
    ```

## Push Changes

To push your local changes to a remote repository, proceed as follows:

1. Make sure you are in the correct branch where you want to push your changes. You can use `git branch` to view your current branch and `git checkout <branch_name>` to switch branches if needed.
2. Execute the following command, replacing `<remote_name>` with the name of the remote repository and `<branch_name>` with the name of the branch you want to push:

    ```bash
    git push <remote_name> <branch_name>
    ```

## Pull Changes

To pull changes from a remote repository into your local repository, follow these steps:

1. Ensure you are in the correct branch where you want to merge the changes.
2. Run the following command, replacing `<remote_name>` with the name of the remote repository and `<branch_name>` with the name of the branch you want to pull from:

    ```bash
    git pull <remote_name> <branch_name>
    ```

## Clone a Repository

To clone a repository from a remote URL, use the `git clone` command followed by the repository URL. Here's how:

1. Open your terminal.
2. Navigate to the directory where you want to clone the repository.
3. Execute the following command, replacing `<repository_url>` with the URL of the repository you want to clone:

    ```bash
    git clone <repository_url>
    ```

This command will create a new directory with the repository name and copy all the files and history from the remote repository into it.

# Advanced Topics

## Rebasing

Rebasing allows you to reapply commits from one branch onto another branch. Here's how to perform a rebase:

1. Switch to the branch where you want to apply the changes.
2. Execute the following command, replacing `<branch_name>` with the name of the branch containing the commits you want to reapply:

    ```bash
    git rebase <branch_name>
    ```

## Cherry-Picking

Cherry-picking enables you to apply specific commits from one branch to another. Follow these steps to cherry-pick a commit:

1. Ensure you are on the branch where you want to apply the commit.
2. Run the following command, replacing `<commit_hash>` with the hash of the commit you want to cherry-pick:

    ```bash
    git cherry-pick <commit_hash>
    ```

## Stashing

Stashing is useful when you want to temporarily store changes without committing them. To stash changes, follow these steps:

1. Use the following command to stash your changes:

    ```bash
    git stash
    ```

2. To apply the stashed changes later, you can use `git stash apply` or `git stash pop`.

## Amend the Last Commit

To amend the last commit with new changes, follow these steps:

1. Make the necessary changes to your files.
2. Stage the changes using `git add` if needed.
3. Run the following command to amend the last commit:

    ```bash
    git commit --amend
    ```

This will open your default text editor to modify the commit message if desired. Then save and exit the editor to finalize the changes.

📚 **RESOURCES**

- [Sample files to follow along](https://1drv.ms/u/s!AmxrofZZlZ-whOIll..)
- Official Git web site: [https://www.git-scm.com/](https://www.git-scm.com/)
- Official GitHub.com web site: [https://github.com/](https://github.com/)
- Git and GitHub.com cheat sheet: [https://education.github.com/git-cheat-sheet](https://education.github.com/git-cheat-sheet)
- Git Reference Manual: [http://git-scm.com/docs](http://git-scm.com/docs)
- Git Overview Book: [http://git-scm.com/book/en/v2](http://git-scm.com/book/en/v2)
- Sample ignore files: [https://github.com/github/gitignore](https://github.com/github/gitignore)
- Hyper.is Terminal: [https://hyper.is/](https://hyper.is/)

#### link to get video tutorial [Git & GitHub Tutorial](https://www.youtube.com/watch?v=tRZGeaHPoaw)

