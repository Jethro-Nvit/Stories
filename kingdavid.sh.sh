#!bin/bash

# Function to check if git is already initialized
check_git_init() {
	if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then echo "Git is already initialized"
	else 
		git init
		echo "Git repository initialized."
	fi 
}

# Function to set global git config for user name and email
set_git_config() {
	    read -p "Enter your Git global user.name: " name
	        read -p "Enter your Git global user.email: " email
		    git config --global user.name "$name"
		        git config --global user.email "$email"

}

# Function to create a new branch and switch to it
create_and_checkout_branch() {
	    read -p "Enter the name of the branch you want to create and checkout (default: main): " branch
	        branch=${branch:-main}
		    git checkout -b "$branch"
}

# Function to add all files and commit
add_and_commit() {
	    git add .
	        read -p "Enter your commit message: " commit_message
		    git commit -m "$commit_message"
	    }

# Function to add remote repository
add_remote() {
	    read -p "Enter the remote repository URL: " remote_url
	        git remote add origin "$remote_url"
	}

# Function to push to remote repository
git_push() {
	    read -p "Enter your Git username: " git_username
	        read -s -p "Enter your Git password: " git_password
		    echo
		        git push -u origin --all
		}

		# Main script execution
		check_git_init
		set_git_config
		create_and_checkout_branch
		add_and_commit
		add_remote
		git_push
