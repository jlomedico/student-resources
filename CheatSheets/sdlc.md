# The Software Development Lifecycle (SDLC)

## Specification
What do you want to build? Takes the form of:
* Lean Startup customer validation
  * What should you build?
  * What do your customers want?
* Agile User Stories
  * Story Tree: Personas -> Goals -> Features -> User Stories -> Scenarios
  * How do you built it?
    * In what (proritized) order?

## Design
* visual design (e.g. UI/UX)
* lean validation
  * Do your customers like your proposed design?
* data model design (e.g. ERDs, boxes and lines)

## Code
Write some code in your _development_ environment (i.e. your laptop).

## Integration
Everyone on your team is working on separate laptops. You need to integrate all of your team's code into one place to make sure it works together.

* Happens in an _integration_ environment
  * a.k.a staging, testing, demo, continuous integration (CI) environments
* You integrate your teammates code every time you do a `git pull`
* `git push`
  * Shares your code with your teammates.
* `git push heroku master` (or whatever you use for hosting)
  * Deploys your code to your server (i.e. shares your code with your non-technical co-workers).
  * e.g. deploying to your _staging_ server (_demo_ server) for other people to play with it

## Release
Release the site to your (real) customers on your real domain and real server.

* Happens in a _production_ environment
* Same as integration, but you deploy to production env instead of staging env
  * `git push production master`


# Environments

## development
*  Your code running on your laptop.
*  Rails dev config is in `config/environments/development.rb`
*  data: just enough for you to test your features locally
## staging
*  aka _demo_, _integration_ environments
*  Rails typically uses `config/environments/production.rb`
*  Why would I create and use `config/environments/staging.rb`?
   * test API keys for things that cost money (e.g. sending email or SMS)
   * fake payment systems (test credit cards)
*  manual testing/QA happens in this environment
*  data: realistic, medium-sized amount of data
## production
*  Rails uses `config/environments/production.rb`
*  data: all your customer's real production data
