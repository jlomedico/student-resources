## tag & release strategy
- `git tag NAME`
  - The name is attached to a commit
  - `NAME` is typically a version number (see [Semantic Versioning](http://semver.org/))
- to release a tag means to `git push TO_WHERE WHAT_TAG_NAME` (to push code to a server)

## staging/demo/integration servers
- Deploy with `git push staging BRANCH_NAME`
- Push code to a server people can use to see your demo or test your app.

## feature branches
- hack: `git branch BRANCH_NAME`
  - start hacking on a feature
- ship: `git checkout master && git merge NAME` (or `git rebase BRANCH_NAME`)
  - add your commits to the `master` branch to share your work with your team
- sink: `git branch -d BRANCH_NAME`
  - delete your branch

## checkout
jumping around the Git tree

## cherry-pick
copying a commit from one place in the tree to another

## stash
temporarily hiding your work-in-progress (WIP) before you do something else (like a `git checkout SOMEWHERE`)

