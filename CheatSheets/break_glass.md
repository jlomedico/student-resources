# Frequently Broken Stuff

## My computer's name is wrong/random

If your computer doesn't have a name (aka `hostname`), the WiFi router will assign one to you. It will typically pick for you the name of a previously connected computer.

If you define a name for your computer, then you won't have to worry about random assigned names.

On Mac:
```sh
sudo scutil --set HostName PUT_THE_NAME_YOU_WANT_HERE
```
You'll need to enter your password to make this change.

## My Ruby version is wrong

The answer is (probably) not to use rvm or rbenv. Try re-installing ruby with your package manager.

On Mac:
```sh
brew uninstall ruby && brew install ruby && brew unlink ruby && brew link --overwrite ruby
```

On Ubuntu:
```sh
# if you have ruby version 2.3, try to remove "ruby2.3"
sudo apt-get remove ruby2.3
# if you want ruby version 2.4, try to install "ruby2.4"
sudo apt-get install ruby2.4

sudo update-alternatives --config ruby
# pick the version of ruby you want from the menu
```

Restart Terminal and confirm the version is now correct
```sh
ruby -v
```

If the version is still wrong, make sure `/usr/local/bin` appears ahead of `/usr/bin` in your `$PATH`.
```sh
echo $PATH
```

## My Ruby is correct, but I can't require my gems

Try re-installing Ruby (see above), then try re-installing your gems.

```sh
gem uninstall --all -Ix
gem install -N bundler
```

If you're using Rails, `cd` into your app, then
```
bundle
```

If you're just working with Ruby, then just install whatever you need.
```
gem install -N sinatra httparty pg nokogiri OR_WHATEVER_GEMS_YOU_NEED
```

## I didn't take your advice and I installed rvm. How do I get rid of it?

```sh
rvm implode
```

Remove any lines referencing `rvm` from your profiles.
```
atom ~/.profile
```
```
atom ~/.bash_profile
```

Restart your Terminal and make sure nothing from `rvm` appears in your `$PATH`.
```
echo $PATH
```


## Ditto, but I used rbenv instead of rvm.

```
rm -rf ~/.rbenv
```

Remove any lines referencing `rbenv` from your profiles.
```
atom ~/.profile
```
```
atom ~/.bash_profile
```

Restart your Terminal and make sure nothing from `rbenv` appears in your `$PATH`.
```
echo $PATH
```

## Wait, what's wrong with rvm and rbenv?

Don't get me wrong. I love them both.

But they're both tools that allow you to install and switch between multiple versions of Ruby. And, as a Wyncoder, for your sanity and ours, it's not useful to have multiple versions of Ruby installed on your computer. It makes debugging problems harder.

For example, Gems are typically installed within a particular Ruby version. So you could install a gem in Ruby version 2.0 and not see it when running a program requiring Ruby version 2.3.

Also, some code may only work in Ruby version 2.4, but not in version 2.3, so you may have trouble following along with the lecture or working in a team.

When you graduate from Wyncode, if you find it necessary to use multiple versions of Ruby on a single computer, then go ahead and install your favorite Ruby version manager. Until then, we need to standardize.

## I've got git repos all over the place!

You can undo a `git init` by deleting the `.git` folder, but you have to be careful. If you delete the wrong `.git` folder, you can lose important data (because _rm is forever!_).

Typical places where you may not want to `git init`.

```sh
# Your home dir
rm -rf ~/.git

# Your Desktop
rm -rf ~/Desktop/.git

# Your entire wyncode folder
rm -rf ~/Desktop/wyncode/.git
```

Be **very careful** when deleting directories like this. If you put a space in any of those paths, **bad things will happen**.

## I can't start Sinatra because something is already running on that port

You need to kill the Sinatra servers running in the background.

```sh
# Mac Terminal
kill $(lsof -n -i:4567 | grep LISTEN | awk '{ print $2 }' | uniq)
```

```sh
# Ubuntu Terminal
kill $(netstat -tulpn | grep 4567 | awk '{ print $7 }' | sed 's/\/.*//g')
```

## I can't start Rails because something is already running on that port

```sh
# Mac Terminal
kill $(lsof -n -i:3000 | grep LISTEN | awk '{ print $2 }' | uniq)
```

```sh
# Ubuntu Terminal
kill $(netstat -tulpn | grep 3000 | awk '{ print $7 }' | sed 's/\/.*//g')
```
