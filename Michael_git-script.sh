#!/bin/bash

# Check if the current directory is already a Git repository
if [ ! -d .git ]; then
  # Initialize a new Git repository
  git init
fi

# Prompt the user for their name and email
read -p "Enter your name: " GIT_USER_NAME
read -p "Enter your email: " GIT_USER_Email

# Configure the user's name and email for the current Git repository
git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_Email"

# Create a new branch called "main" and switch to it
git checkout -b main

# Add all the files in the current directory to the Git staging area
git add .

# Commit the changes with a default message
git commit -m "Initial commit"

# Prompt the user for the name of the remote repository
read -p "Enter the name of the remote repository: " GIT_REMOTE_NAME

# Add the remote repository
git remote add origin "$GIT_REMOTE_NAME"

# Push the local "main" branch to the remote repository
git push -u origin main
