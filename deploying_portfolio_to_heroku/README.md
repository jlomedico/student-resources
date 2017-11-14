# Deploying Your Portfolio Site To Heroku

## Create A New Project

`cd` to your projects folder, then create a new project

```sh
mkdir portfolio
cd portfolio
git init
```

## Write Some Code

Quickly create some empty files

```sh
touch server.rb Gemfile Procfile
```

Open your code editor (Atom or SublimeText, but we'll use Atom as our example.)
```sh
atom .
```

Fill in the empty files.

`server.rb`:
```ruby
require 'sinatra'
```

`Gemfile`:
```ruby
source "https://rubygems.org"
ruby "2.2.3" # <-- or whatever your current version of ruby is according to "ruby -v"
gem "sinatra"
````

`Procfile`:
```
web: ruby server.rb -p $PORT
```

### Validate your Gemfile

In the Terminal, let's bundle the `Gemfile`.
```
bundle
```
`bundle` is short for `bundle install`

You should now have 4 (and only 4) files in your project.
* `server.rb`
* `Gemfile`
* `Gemfile.lock`
* `Procfile`


### Copy Your Files

In the Terminal, copy your HTML, CSS, and JavaScript files from wherever they're currently located into a new folder named `public`.

```sh
mkdir public
cp -r wherever-your-portfolio-code-is/* public/
```

### Test Your Site

In the Terminal, run the server.

```sh
ruby server.rb
```

In the browser, confirm that your portfolio site is working correctly at `http://localhost:4567/whatever-my-homepage-is-called.html`.

### Git Your Site

Once the site is verified, commit it to git.

```sh
git add .
git commit -m "my site on Heroku"
```

### Deploy Your Site

Reserve a Heroku dyno and domain name.

```sh
heroku create
```

... and deploy your site to your dyno.

```sh
git push heroku master
```

### Test Your Live Site 

Visit your site at `https://random-stuff-123456.herokuapp.com/whatever-my-page-is-called.html` and confirm that it is working correctly.

Tip: use `heroku open` to load the base URL in the browser, then just add your page name.

_Everyone_ in the class should have their portfolio site deployed to Heroku.

### Bonus Tasks

* Customize your Heroku domain name on `Heroku.com`.
  * Don't forget to [update your remotes](https://devcenter.heroku.com/articles/renaming-apps#updating-git-remotes).
* Get your site to load at the root `/` instead of `/mysite.html`
  * This is a homework question.
* Push your app to your GitHub account. You'll have two remotes, `heroku` and `origin`.

### Conclusion

Wrap up this live coding session by doing a critique of some of the portfolio sites. Load them up by their Heroku URL.
