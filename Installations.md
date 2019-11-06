# Setting Up for Development on WebSiteOneBackendApi

These are the steps for setting up your development environment for WebSiteOne Backend api project.
This covers the tools you need to have installed and any specific configuration(s).


### Step 1: Git ready (`git` and GitHub)
We use git for version control and keep the project repository on GitHub.
You'll need to be able to use both of those.

* Register on [Github](http://github.com)  (it's free)
* Install [git](https://git-scm.com/)

### Step 2: Get your own local copy of the project to work on
You'll do your development work on your own copy of the project.


* On GitHub, fork [AgileVentures/WebsiteOneBackendApi](https://help.github.com/articles/fork-a-repo/) into your own GitHub area. 
* Clone your fork to your local development machine (or where-ever you are going to do your development coding).
  To clone the fork, run the following command on your local machine:
    
    `git clone https://github.com/<your-github-name>/WebsiteOneBackendApi`

If you need more information about git and GitHub, see this [general guide to getting set up with an AgileVentures project](http://www.agileventures.org/articles/project-setup-new-users) (use https://github.com/AgileVentures/WebsiteOneBackendApi as the project URL).


You should now have the entire project -- all of the directories and files -- on your local machine, _and_ it should have a `git` repository (`.git`).


The whole process of doing a PR and getting it reviewed and merged into this project is described in [CONTRIBUTING.md](CONTRIBUTING.md).

#### Keeping a fork up to date
1. Clone your fork:
```
git clone git@github.com:YOUR-USERNAME/YOUR-FORKED-REPO.git
```

2. Add remote from original repository in your forked repository:
```
cd into/cloned/fork-repo
git remote add upstream https://github.com/AgileVentures/WebsiteOneBackendApi.git
git fetch upstream
```
3. Updating your fork from original repo to keep up with [WebsiteOneBackendApi](https://github.com/AgileVentures/WebsiteOne):
```
git pull upstream develop
```

## Local Installation

### Step 1: Install the gems with `bundle install`

    bundle install

**Note:** On OSX El Capitan and above, you may get this error:

    An error occurred while installing eventmachine (1.0.7), and Bundler cannot continue.
    Make sure that `gem install eventmachine -v '1.0.7'` succeeds before bundling.

If you then try to install the `eventmachine` gem, it also fails like this: https://github.com/eventmachine/eventmachine/issues/643.
 That's because OpenSSL is no longer distributed with OS X. So you may need to use brew to set up OpenSSL:

    brew link openssl --force

After you do that, re-try running `bundle install` and you should be good to go on to the next step.
    
#### PostgreSQL and the `pg` gem
The database used is [postgreSQL](https://www.postgresql.org/).  You need to have this installed and running on your local machine. 
(The `pg` gem accesses the postgreSQL database.)

#### Updating Rails
If you need to update rails, you can run `bundle update rails`.  If you run into problems with rails and `libv8` on OS X, try this:
```shell
   gem uninstall libv8
   brew install v8
   gem install therubyracer
   gem install libv8 -v '3.16.14.3' -- --with-system-v8
```
    
### Step 2: Install javascript dependencies using `yarn`
* Use [yarn](https://yarnpkg.com/lang/en/) to install all of the javascript dependencies:

    `yarn install`



### Step 3: Set up the database

* We using the database used in WebsiteOne. Ask for a copy of `config/database.yml`the [websiteone slack channel](https://agileventures.slack.com/archives/C029E8G80).

### Step 4: Run the tests

Now you're ready to run the tests:

    bundle exec rake spec

Discuss any errors with the team on Slack, in a scrum, or in mob or pair programming.

### Step 5. Start the server

    bundle exec rails s
    
You can now test your endpoints on your local development environment!
    
Be sure to read and understand [how to contribute](CONTRIBUTING.md) when you're ready to start developing and contributing.
 


## Code Style

We recommend and follow the [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide)





[Note: This page is edited from WSO project  at  https://github.com/AgileVentures/WebsiteOne/edit/develop/docs/project_setup.md


