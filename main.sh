# git commands
add() {
	if [ $1 ]; then
		git add $1;
	else
		echo "Not enough files specified.";
	fi
}
branch() {
	if [[ $1 == "-a" ]] &&  [ $2 ]; then
		if [ $2 ]; then
			git branch $2 &&
			git branch;
		else
			echo "No branch name specified.";
		fi
	elif [[ $1 == "-d" ]] &&  [ $2 ]; then
		if [ $2 ]; then
			git branch -d $2 &&
			git branch;
		else
			echo "No branch name specified.";
		fi
	else
		git branch;
	fi
}
checkout() {
	if [ $1 ]; then 
		git checkout $1;
	else
		echo "No branch name specified.";
	fi
}
clone() {
	if [ $1 ]; then
		git clone $1;
	else
		echo "No remote URL specified";
	fi
}
commit() {
	if [[ $1 ]]; then
		git commit -m "$1";
	else
		echo "No commit message entered.";
	fi
}
log() {
	git log;
}
merge() {
	if [ $1 ]; then
		git merge $1;
	else
		echo "No branch name specified";
	fi
}
pull() {
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
		git push;
	fi
}
remote() {
	if [[ $1 == "-a" ]]; then
		if [ $3 ] && [ $2 ]; then
			git remote add $2 $3;
		else
			echo "No remote name and/or remote URL specified.";
		fi
	else
		git remote;
	fi
}
status() {
	git status;
}

