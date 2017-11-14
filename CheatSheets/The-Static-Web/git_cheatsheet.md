git Code snippets



```bash
git help
git --help

git --help add
git help add
```
```bash
Getting started
git init
```
```bash

ls -al
find .git
git status
On branch master

Initial commit

nothing to commit (create/copy files and use "git add" to track)

```
```bash
git status
touch wyncode.txt

git status
```
```bash
git status
Untracked files:
  (use "git add <file>..." to include in what will be committed)

  wyncode.txt

nothing added to commit but untracked files present (use "git add" to track)

git add
git add wyncode.txt

git status
```
```bash
git add
Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

  new file:   wyncode.txt
```
```bash
git rm
git rm --cached wyncode.txt
git status

git add wyncode.txt
git status
git commit
git commit -m "Add wyncode file"
```
```bash
git config
Committer: Ed Toro <etoro@eds-macbook-pro.gateway.2wire.net>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly:

    git config --global user.name "Your Name"
    git config --global user.email you@example.com

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author
```
```bash
git config
git config --global user.name "Ed Toro"
git config --global user.email "ed@wyncode.co"

git commit --amend --reset-author --no-edit

git log
commit 60969bc312dfcfb108cfd10c8613f924c7a25f96
Author: Ed Toro <ed@wyncode.co>
Date:   Fri May 05 10:00:10 2014 -0400

    Add wyncode file

git config --global
cat ~/.gitconfig

[user]
  name = Ed Toro
  email = ed@wyncode.co
```
```bash
Git Workflow
Create and edit files.
Add the files to the staging area.
Commit the staging area.
```
```bash
git add
touch problem1.rb
touch problem2.rb
touch work_in_progress.rb

git add '*.rb'
```
```bash

git status
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  new file:   problem1.rb
  new file:   problem2.rb
  new file:   work_in_progress.rb
```
```bash
git reset
git reset HEAD work_in_progress.rb

git status
git status
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  new file:   problem1.rb
  new file:   problem2.rb

Untracked files:
  (use "git add <file>..." to include in what will be committed)

  work_in_progress.rb

git commit (some files)
git commit -m "Solve problems 1 and 2"
```
```bash
git status
git status
Untracked files:
  (use "git add <file>..." to include in what will be committed)

  work_in_progress.rb

git add …oops
git add work_in_progress.rb

git commit -m "Committing some work"
```
```bash
git status
git status
On branch master
nothing to commit, working directory clean

git log --name-only
commit 61da0be531d2137a4c3ad22aa76894c1ec540e74
Author: Ed Toro <ed@wyncode.co>
Date:   Fri Apr 25 10:18:01 2014 -0400
```
```bash
    Committing some work in progress.

work_in_progress.rb
git rm
git rm work_in_progress.rb

git rm --cached work_in_progress.rb

git status
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  deleted:    work_in_progress.rb

Untracked files:
  (use "git add <file>..." to include in what will be committed)

  work_in_progress.rb

Undo add file
git commit -m "Delete work_in_progress"
```
```bash
git add… oops (#2)
git add work_in_progress.rb
git commit -m "Mistake #2"

git log
commit 29edb23c18cf825426127267d8a15c92cae02ff4
Author: Ed Toro <ed@wyncode.co>
Date:   Fri Apr 25 10:29:50 2014 -0400

    Mistake #2

git revert
git revert -n 29edb23c18cf825426127267d8a15c92cae02ff4

git revert --abort
git revert -n 29edb23
git status
You are currently reverting commit 29edb23.
  (all conflicts fixed: run "git revert --continue")
  (use "git revert --abort" to cancel the revert operation)

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  deleted:    work_in_progress.rb

commit the revert
git commit -m "Revert mistake #2"
```
```bash
oops
ls

problem1.rb problem2.rb wyncode.txt

retrieve a backup
commit 87032f2843d4f9571ebf4078d0d9a936eae0fb33
Author: Ed Toro <ed@wyncode.co>
Date:   Fri Apr 25 10:55:19 2014 -0400
```
```bash
    Revert mistake #2

commit 29edb23c18cf825426127267d8a15c92cae02ff4
Author: Ed Toro <ed@wyncode.co>
Date:   Fri Apr 25 10:29:50 2014 -0400
```
```bash
    Mistake #2

git checkout
git checkout 29edb23c18cf825426127267d8a15c92cae02ff4 work_in_progress.rb

git status
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  new file:   work_in_progress.rb

git reset HEAD work_in_progress.rb
```
```bash
Do some damage
rm problem1.rb
Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

  deleted:    problem1.rb
```
```bash
Do some damage
echo "Hello world" >> problem2.rb

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

  deleted:    problem1.rb
  modified:   problem2.rb

git reset
git reset --hard
```
```bash
git status
Untracked files:
  (use "git add <file>..." to include in what will be committed)

  work_in_progress.rb
```
```bash
Git snapshots
rm work_in_progress.rb

echo "puts 'Hello world'" >> problem1.rb

git status
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

  modified:   problem1.rb

```
```bash
Git snapshots
git add problem1.rb
git status
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  modified:   problem1.rb
```
```bash
Git snapshots
echo "puts 'Again'" >> problem1.rb

Git snapshots
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

  modified:   problem1.rb

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

  modified:   problem1.rb
```
```bash
Where's GitHub?


Up in flames
rm -rf {your_directory_name_here}


git clone
git clone https://github.com/eddroid/wyncode.git
```
```bash
cd wyncode
ls
git log
Collaboration
touch problem3.rb
git add problem3.rb
git commit -m "Solve problem 3"
```
```bash
git status
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)

git push
```
```bash

git status
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working directory clean


```
```bash


git fetch --all
$ git fetch --all
Fetching origin
remote: Counting objects: 3, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 1), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), done.
From github.com:eddroid/wyncode
   6a45bac..3f03b3d  master     -> origin/master

```
```bash
git status
$ git status
On branch master
Your branch is behind 'origin/master' by 1 commit, and can be fast-forwarded.
  (use "git pull" to update your local branch)
nothing to commit, working directory clean


```
```bash

git pull
From https://github.com/eddroid/wyncode
   961257a..c76778c  master     -> origin/master
Updating 961257a..c76778c
Fast-forward
 README.md | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 README.md

```
```bash
push and pull
git push
upload my commits to GitHub

git pull
download someone else’s commits from GitHub
conflicting edits
echo "puts 'Hello world'" >> problem1.rb

git add problem1.rb

git commit -m "Update the answer to problem1"

```
```bash
Conflicting edits
git push
To https://github.com/eddroid/wyncode.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'https://github.com/eddroid/wyncode.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
git pull
From https://github.com/eddroid/wyncode
   c76778c..390b509  master     -> origin/master
Auto-merging problem1.rb
CONFLICT (content): Merge conflict in problem1.rb
Automatic merge failed; fix conflicts and then commit the result.
cat problem1.rb
<<<<<<< HEAD
puts 'Hello world'
=======
puts "Wassup world"
>>>>>>> 390b509dfe4171ae4db23ed420409a671e1afd2b
```
```bash

Fix problem1.rb
echo 'puts "Hello world"' > problem1.rb

cat problem1.rb

puts "Hello world"

git status
You have unmerged paths.
  (fix conflicts and run "git commit")

Unmerged paths:
  (use "git add <file>..." to mark resolution)

  both modified:      problem1.rb

git status
All conflicts fixed but you are still merging.
  (use "git commit" to conclude merge)

Changes to be committed:

  modified:   problem1.rb

```
```bash
Resolve merge conflict
git commit -m "resolved merge conflict in problem1"

git status
Your branch is ahead of 'origin/master' by 2 commits.
  (use "git push" to publish your local commits)

git push
Counting objects: 10, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (4/4), done.
Writing objects: 100% (6/6), 567 bytes | 0 bytes/s, done.
Total 6 (delta 2), reused 0 (delta 0)
To https://github.com/eddroid/wyncode.git
   390b509..c29e0ce  master -> master
git status
On branch master
Your branch is up-to-date with 'origin/master'.

nothing to commit, working directory clean
```
```bash
git log
commit c29e0ce3fdcce4eafe858926bfccc3c0abf950e7
Merge: 422595b 390b509

    resolve merge conflict in problem1

commit 390b509dfe4171ae4db23ed420409a671e1afd2b

    Update the answer to problem1 on GitHub

commit 422595b5f76d1c2ce218f5eec7423475cceb8337

    Update the answer to problem1
```
```bash
One last thing...
echo "puts 'The end?'" > problem2.rb

git status
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

  modified:   problem2.rb

git diff
diff --git a/problem2.rb b/problem2.rb
index e69de29..e60614c 100644
--- a/problem2.rb
+++ b/problem2.rb
@@ -0,0 +1 @@
+puts 'The end?'

The end?
https://octodex.github.com/
```
