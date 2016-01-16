# Git High Level CLI

Git just got *that* much easier! The Git High-Level CLI simplifies the git process by bringing the actual git commmands to the top level of the Terminal script.

|Status|
|------|
|0.1.0 |

## Overview

GHL CLI removes the need to type `git` while still accessing the commands.

## Installation

Ensure that you have [git](https://git-scm.com/) installed. Visit their [downloads](https://git-scm.com/downloads) page for various options of downloading the SCM, and visit their [documentation](https://git-scm.com/doc) for reference and guides.

Clone this repo to a `.bash` directory in your root directory:

```bash
mkdir ~/.bash # if you don't already have a .bash directory here
cd ~/.bash
git clone git@github.com:fullstax/git-high-level-cli.git
```

Edit your `~/.bash_profile`, `~/.bashrc`, or `~/.profile` and add the following code to the top:

```bash
export GITHIGHLEVELCLI=~/.bash/git-high-level-cli
source "${GITHIGHLEVELCLI}/main.sh"
```
Once you restart your Terminal/Bash shell or open up a new window/tab, you'll be able to use the new commands!

## Commands

The following commands are currently supported by GHL CLI:

|script|description|
|------|-----------|
|`$ ghl`|Prints out description and meta info in shell.|
|`$ ghl`|view this message.|
|`$ add`|add files to stage.|
|`$ branch`|view/add/remove branches.|
|`$ checkout`|change branches.|
|`$ clone`|clone repos.|
|`$ commit`|commit staged files.|
|`$ ignore`|adds to ignore file or creates new ignore file with output.|
|`$ log`|view past commits.|
|`$ merge`|merge a branch with the current branch.|
|`$ pull`|pull from a remote repo.|
|`$ push`|push to a remote repo.|
|`$ pushup`|push to and set upstream.|
|`$ remote`|view/add/remove remotes.|
|`$ status`|view staged/untracked files.|


## Updating

Updating is simple; just navigate to the `.bash` directory that you installed the project to, and pull:

```bash
cd ~/.bash/git-high-level-cli
git pull
```

## License

[The MIT License](https://github.com/fullstax/git-high-level-cli/blob/master/LICENSE)
