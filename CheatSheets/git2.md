# Git 2 Cheatsheet

## Tag & Release

Code
```sh
git add .
git commit -m "finished this feature"
```
Prepare production environment
```sh
heroku create
```
Release
```sh
git tag v0.0.1 # version 0.0.1
git push heroku v0.0.1 # simplification, see http://blog.firsthand.ca/2010/10/pushing-specific-tags-to-heroku.html
```

## Patch/Hotfix/Bugfix/Fix Deployments

Return back to the old version and create a fix branch.
```sh
git checkout -b fix-0.0.1 v0.0.1
```

Code
```sh
git add .
git commit -m "fixing a bug"
```

Tag & release
```sh
git tag v0.0.2
git push heroku v0.0.2
```

## Feature Branches

Hack
```sh
git checkout -b feature_branch_name
```
Code
```sh
git add .
git commit -m "working on a feature"
```
Ship
```sh
git checkout master
git merge feature_branch_name
```
Sink
```sh
git branch -d feature_branch_name
```

## Cherry-Pick Fix

Return back to old version of the code and branch.
```sh
git checkout -b fix-0.0.2 v0.0.2
```

Copy a commit from somewhere else into this branch.
```sh
git cherry-pick ABC123 # commit-id
```

Tag & release.
```sh
git tag v0.0.3
git push heroku v0.0.3
```

# Staging & Production Environments

Rename the existing server _production_
```sh
git remote rename heroku production
```

Create a new server and name it _staging_.
```sh
heroku create --remote staging
```

Deploy to staging with
```sh
git push staging branch_or_tag_name
```

Deploy to production with
```sh
git push production branch_or_tag_name
```

# Stashing

Stash your work in progress (WIP).
```sh
git stash
```

`checkout` to some other part of your Git tree to do some work (e.g. work on a _feature branch_ or make and deploy a fix).

When you `checkout` back to where you started, you can pick up where you left off.
```sh
git stash pop
```

# Rolling Back Releases

Assume you released version 1.0.0 to production (i.e. `git push production 1.0.0`) and it doesn't work.

Before you rollback the code, rollback the migrations. Database rollbacks are _optional_ if you only added tables and columns in the update to 1.0.0. If you removed or renamed tables or columns, then it's _required_.
```sh
heroku run rails db:rollback
heroku run rails db:migrate:status
# repeat until all the new migrations you added in 1.0.0 are "down"
```

Once the database is rolled-back, you can deploy the older version of the site.
```sh
# assuming the version before 1.0.0 is 0.4.0
git push production 0.4.0
```
