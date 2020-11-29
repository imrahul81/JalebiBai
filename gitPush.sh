#!/bin/bash
echo Adding and pushing changes to GitHub

echo Pass the absolute Repo name:
read Repo_name
cd $Repo_name
git fetch

echo Pass the Branch name:
read Branch_name

echo "Have you already created a branch in Bitbucket?(y/n)"
read Yes_or_No

if [ "$Yes_or_No" == "y" ]
then 
    git checkout $Branch_name
elif [ "$Yes_or_No" == "n" ]
then 
    git checkout -b $Branch_name
else
    echo "Wrong choice"
fi

git status
sleep 5

echo "Are these the files you want to commit? (y/n)"
read Yes_or_No

if [ $Yes_or_No == "y" ]
then
    git add .
    echo "Please enter a commit message with the ticket no"
    read Commit_message
    git commit -m "$Commit_message"
    echo "Pushing your changes"
    sleep 2
    git push --set-upstream origin $Branch_name
elif [ $Yes_or_No == "n" ]
then
    echo "Please make the required file changes and run the script again"
    echo "Bye bye!"
else 
    echo "Wrong choice"
fi
cowsay "We are done!"