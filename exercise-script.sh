#!/bin/bash

# Function to check if git is already initialized
check_git_init() {
    if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
        echo "Git is already initialized."
    else
        git init
        echo "Git repository initialized."
    fi
}

# Function to set global configurations
set_global_config() {
    read -p "Enter your global git user.name: " name
    read -p "Enter your global git user.email: " email
    git config --global user.name "$name"
    git config --global user.email "$email"
}

# Function to create a new branch and switch to it
create_and_checkout_branch() {
    git checkout -b main
}

# Function to add files to staging
git_add() {
    git add .
}

# Function to commit changes
git_commit() {
    read -p "Enter commit message: " commit_message
    git commit -m "$commit_message"
}

# Function to add remote repository
git_remote_add() {
    read -p "Enter remote repository URL: " remote_url
    git remote add origin "$remote_url"
}

# Function to push changes
git_push() {
    read -p "Enter your git username: " username
    read -s -p "Enter your git password: " password
    echo
    git push -u origin main
}
