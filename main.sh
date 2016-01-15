# git commands
ghl() {
	# print out project description, commands/meta info
	echo "*******************************************************************";
	echo "*  Git-High-Level CLI is a small library of bash shell            *";
	echo "*  commands to shortcut several git commands                      *";
	echo "*                                                                 *";
	echo "*  === COMMANDS ===                                               *";
	echo "* ghl   		: view this message.                      *";
	echo "* add   		: add files to stage.                     *";
	echo "* branch   		: view/add/remove branches.               *";
	echo "* checkout   		: change branches.                        *";
	echo "* clone   		: clone repos.                         	  *";
	echo "* commit   		: commit staged files.                    *";
	echo "* log   		: view past commits.                      *";
	echo "* merge   		: merge a branch with the current branch. *";
	echo "* pull   		: pull from a remote repo.                *";
	echo "* push   		: push to a remote repo.                  *";
	echo "* pushup   		: push to and set upstream.               *";
	echo "* remote   		: view/add/remove remotes.                *";
	echo "* status   		: view staged/untracked files             *";
	echo "*******************************************************************";
}
add() {
	if [ $1 ]; then
		# add passed files
		# !important: $1 must be passed as a string if not using traidtional git
		# 		commands, or if passing more than one file.
		# ToDo: add loop component from personal bash file
		git add $1;
	else
		echo "Not enough files specified.";
	fi
}
branch() {
	if [[ $1 == "-a" ]] &&  [ $2 ]; then
		if [ $2 ]; then
			# add branch passed as argument 2, then print branches
			git branch $2 &&
			git branch;
		else
			echo "No branch name specified.";
		fi
	elif [[ $1 == "-d" ]] &&  [ $2 ]; then
		if [ $2 ]; then
			# remove branch passed as argument 2, then print branches
			git branch -d $2 &&
			git branch;
		else
			echo "No branch name specified.";
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
		echo "No branch name specified.";
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
		echo "No remote URL specified";
	fi
}
commit() {
	if [[ $1 ]]; then
		# commit stage with message as passed argument
		# !important: $1 must be passed as a string
		git commit -m "$1";
	else
		echo "No commit message entered.";
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
		echo "No branch name specified";
	fi
}
pull() {
	# pull from current set remote, showing progress
	git pull --progress;
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
	if [ $2 ]; then
		if [ $3 ]; then
			# push commits to upstream, with argument $2 being the remote, and
			# 		$3 being the branch.
			git push -u $2 $3;
		else
			echo "Missing remote branch name.";
		fi
	else
		echo "Missing remote name.";
	fi
}
remote() {
	if [[ $1 == "-a" ]]; then
		if [ $3 ] && [ $2 ]; then
			# add remote, with argument $2 being the remote name and argument $3
			# 		being the URL to the remote repo
			git remote add $2 $3;
		else
			echo "No remote name and/or remote URL specified.";
		fi
	else
		# print remotes
		git remote;
	fi
}
status() {
	# show status of HEAD
	git status;
}

