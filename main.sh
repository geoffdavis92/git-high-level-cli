# git commands
ghl() {
	# print out project description, commands/meta info
	echo "*******************************************************************";
	echo "*  Git-High-Level CLI is a small library of bash shell            *";
	echo "*  commands to shortcut several git commands                      *";
	echo "*                                                                 *";
	echo "*  === COMMANDS ===                                               *";
	echo "* ghl   		: view this message.                      *";
	echo "* acp                   : add, commit with message, and push to   *";
	echo "*                       default branch                            *";
	echo "* add   		: add files to stage.                     *";
	echo "* branch   		: view/add/remove branches.               *";
	echo "* checkout   		: change branches.                        *";
	echo "* clone   		: clone repos.                         	  *";
	echo "* commit   		: commit staged files.                    *";
	echo "* ignore 		: ignores passed files or creates         *";
	echo "*                         gitignore with passed files             *";
	echo "* log   		: view past commits.                      *";
	echo "* merge   		: merge a branch with the current branch. *";
	echo "* pull   		: pull from a remote repo.                *";
	echo "* push   		: push to a remote repo.                  *";
	echo "* pushup   		: push to and set upstream.               *";
	echo "* remote   		: view/add/remove remotes.                *";
	echo "* status   		: view staged/untracked files             *";
	echo "*******************************************************************";
}
acp() {
	if [[ $1 ]]; then
		git add --all && git commit -m "$1" && git push;
	else
		echo "No commit message";
	fi
}
add() {
	# add passed files
	# !important: $1 must be passed as a string if not using traidtional git
	# 		commands, or if passing more than one file.
	str="";
	for el in $@; do
	    str="$str $el";
	done
	if [ $str == "." ]; then
		msg="this directory";
		echo "Added— $msg –to git stage";
		str=".";
		git add "$str";
	elif [ $str == "*" ]; then
		msg="all files";
		echo "Added— $msg –to git stage";
		str="*";
		git add "$str";
	elif [ $str == "all" ]; then
		msg="all changed files";
		echo "Added— $msg –to git stage";
		str="--all";
		git add "$str";
	else
		# msg="Added to git stage";
		echo "Added— $str.";
		git add $str;
	fi
}
branch() {
	if [[ $1 ]] && [[ $1 != "-d" ]]; then
		# add branch passed as argument 2, then print branches
		git branch $1 &&
		git branch;
	elif [[ $1 == "-d" ]] &&  [ $2 ]; then
		if [ $2 ]; then
			# remove branch passed as argument 2, then print branches
			git branch -d $2 &&
			git branch;
		else
			echo "!ERROR : No branch name specified.";
		fi
	else
		# print branches
		git branch;
	fi
}
checkout() {
	if [ $1 ]; then
		# checkout passed branch 
		git checkout $1;
	else
		echo "!ERROR : No branch name specified.";
	fi
}
clone() {
	if [ $1 ]; then
		if [[ $1 == "-p" ]] || [[ $1 == "paste" ]]; then
			# clone repo URL from clipboard
			git clone $(pbpaste);
		else
			# clone repo URL from argument
			git clone $1;
		fi
	else
		echo "!ERROR : No remote URL specified";
	fi
}
commit() {
	if [[ $1 ]]; then
		# commit stage with message as passed argument
		# !important: $1 must be passed as a string
		git commit -m "$1";
	else
		echo "!ERROR : No commit message entered.";
	fi
}
ignore() {
	if [[ -e ".gitignore" ]]; then
		str="";
		for el in $@; do
		    str="$str \n$el";
		done
		printf "$str" >> .gitignore;
	else
		# from http://bit.ly/1ZEe0kb
		# to assign to a variable
		result=${PWD##*/};
		str="# $result ignores...";
		for el in $@; do
		    str="$str \n$el";
		done
		printf "$str" >> .gitignore;
	fi
}
log() {
	# print log of past commits
	git log;
}
merge() {
	if [ $1 ]; then
		# merge passed branch with current branch
		git merge $1;
	else
		echo "!ERROR : No branch name specified";
	fi
}
pull() {
	if [[ $1 ]] && [[ $2 ]]; then
		# pull from remote repo where argument $1 is remote name and
		#		argument $2 is remote branch name
		git pull $1 $2;
	else
		# pull from current set remote, showing progress
		git pull --progress;
	fi
}
push() {
	if [ $2 ]; then
		# push to remote + branch
		git push $1 $2;
	elif [ $1 ]; then
		# push to remote, auto-branch detection
		git push $1;
	else
		# push to currently set upstream source; alias to `push() $1`
		git push;
	fi
}
pushup(){
	if [ $1 ]; then
		if [ $2 ]; then
			# push commits to upstream, with argument $2 being the remote, and
			# 		$3 being the branch.
			git push -u $1 $2;
		else
			echo "!ERROR : No remote branch name specified.";
		fi
	else
		echo "!ERROR : No remote name specified.";
	fi
}
remote() {
	if [[ $1 ]]; then
		if [ $1 != "-d" ] && [ $2 ]; then
			# add remote, with argument $1 being the remote name and argument $2
			# 		being the URL to the remote repo
			git remote add $1 $2;
		elif [ $1 == "-d" ] && [ $2 ]; then
			git remote remove #2
		else
			echo "!ERROR : No remote name and/or remote URL specified.";
		fi
	else
		# print remotes
		git remote;
	fi
}
rollback() {
	# git reset --hard <tag/branch/commit id>
	if [ $1 ]; then
		if [[ $1 == "-p" ]]; then
			git reset --hard $(pbpaste)
		else
			git reset --hard $1;
		fi
	else
		echo "No reference given";
	fi
}
status() {
	# show status of HEAD
	git status;
}

