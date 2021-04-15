GIT CYCLE > UNMODIFIED (change) > MODIFIED (staging) > STAGED (commit)
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

git config user.name "NAME" #set the commit to this user before do the change
git config user.email "EMAIL"

git config --global user.name "NAME" #set this user to global user for the repository
git config --global user.email "EMAIL"

git config --list #see the current settings parameters of the system

git add *.* #track all the files
git commit -m "MESSAGE COMMIT" #send it to the git folder online (stage the files)

git status
git log
git pull #error rejection
git push origin master

git fetch origin master

git merge NEW_BRANCH #to add all the changes of the other branch to the master
git merge -d BRANCH #remove the branch

git checkout -b NAME #create a new branch
git checkout master #switch to the main branch