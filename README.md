# Git High Level CLI

Git just got *that* much easier! The Git High-Level CLI simplifies the git process by bringing the actual git commmands to the top level of the Terminal script.

|Status|
|------|
|0.5.2 |

## Overview

GHL CLI removes the need to type `git` while still accessing the commands.

## Installation

Ensure that you have [git](https://git-scm.com/) installed. Visit their [downloads](https://git-scm.com/downloads) page for various options of downloading the SCM, and visit their [documentation](https://git-scm.com/doc) for reference and guides.

Clone this repo to a `.bash` directory in your root directory:

```bash
$ mkdir ~/.bash # if you don't already have a .bash directory here
$ cd ~/.bash
$ git clone git@github.com:fullstax/git-high-level-cli.git
```

---
#### Note: Read before continuing
Once you include the succeeding export/source lines in your `~/.bash*` file(s), some commands with the same name may override or be overridden by the GHL file, depending on the hierarchy of that file. 

If you notice you overrode a command, simply comment out/remove the export/source lines, or rename one of the instances of the conflicted command to something else.  

---

Edit your `~/.bash_profile`, `~/.bashrc`, or `~/.profile` and add the following code to the top:

```bash
export GITHIGHLEVELCLI=~/.bash/git-high-level-cli
source "${GITHIGHLEVELCLI}/main.sh"
```
Once you restart your Terminal/Bash shell or open up a new window/tab, you'll be able to use the new commands!

## Commands

The following commands are currently supported by GHL CLI:

|script|description|alias|
|------|-----------|-----|
|`$ ghl`|Prints out description and meta info in shell.|no alias|
|`$ acp`|add, commit with message, and push to default branch.|`$ git add --all && git commit -m <msg> && git push`|
|`$ add`|add files to stage.|`$ git add [*|.|--all|<files>]`|
|`$ branch`|view/add/remove branches.|`$ git branch [-a|-d|<branchname>]`|
|`$ checkout`|change branches.|`$ git checkout <branchname>`|
|`$ clone`|clone repos.|`$ git clone <remoterepoURL>`|
|`$ commit`|commit staged files.|`$ git commit -m <message>`|
|`$ ignore`|adds to ignore file or creates new ignore file with output.|no alias|
|`$ log`|view past commits.|`$ git log`|
|`$ merge`|merge a branch with the current branch.|`$ git merge <branchname>`|
|`$ pull`|pull from a remote repo.|`$ git pull [<branchname>]`|
|`$ push`|push to a remote repo.|`$ git push [<remote>]`|
|`$ pushup`|push to and set upstream.|`$ git push -u <remote> <branchname>`|
|`$ remote`|view/add/remove remotes.|`$ git remote [add <remotename> <remoteURL>]`|
|`$ status`|view staged/untracked files.|`$ git status`|


## Updating

Before you update, you can check the current version of your clone of GHL by entering the following in your shell:

```bash
$ ghl v # short version
$ ghl version # long version
```

Updating is simple; just navigate to the `.bash` directory that you installed the project to, and pull:

```bash
$ cd ~/.bash/git-high-level-cli
$ pull # assuming you have the GHL pull command setup
```

## License

[The MIT License](https://github.com/fullstax/git-high-level-cli/blob/master/LICENSE)
