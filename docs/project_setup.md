# Setting Up for Development _(Project Set Up)_

These are the steps for setting up your development environment for WebSiteOneBackendApi project.
This covers the tools you need to have installed and any specific configuration(s).

## Step 1: Git ready (`git` and GitHub)

We use git for version control and keep the project repository on GitHub.
You'll need to be able to use both of those.

* Register on [Github](http://github.com)  (it's free)
* Install [git](https://git-scm.com/)

## Step 2: Get your own local copy of the project to work on

You'll do your development work on your own copy of the project.

* On GitHub, fork [AgileVentures/WebSiteOneBackendApi](https://help.github.com/articles/fork-a-repo/) into your own GitHub area.
* Clone your fork to your local development machine (or where-ever you are going to do your development coding).
  To clone the fork, run the following command on your local machine:

    `git clone https://github.com/<your-github-name>/WebsiteOneBackendApi`

You should now have the entire project -- all of the directories and files -- on your local machine, _and_ it should have a `git` repository (`.git`).

### Keeping a fork up to date

1. Clone your fork:

   ```bash
   git clone git@github.com:YOUR-USERNAME/YOUR-FORKED-REPO.git
   ```

2. Add remote from original repository in your forked repository:

   ```bash
   cd into/cloned/fork-repo
   git remote add upstream https://github.com/AgileVentures/WebsiteOne.git
   git fetch upstream
   ```

3. Updating your fork from original repo to keep up with [WebsiteOneBackendApi](https://github.com/AgileVentures/WebsiteOneBackendApi):

   ```bash
   git pull upstream develop
   ```

### Step 3: Install the gems with `bundle install`

```bash
bundle install
```

#### PostgreSQL and the `pg` gem

The database used is [postgreSQL](https://www.postgresql.org/).  You need to have this installed and running on your local machine.
(The `pg` gem accesses the postgreSQL database.)  [Here are instructions on installing postgreSQL.](development_environment_set_up.md#postgreSQL)

### Step 4: Set up the database

Run the rake command to set up the database.  Be sure to use `bundle exec` so that the gems specific to this project (listed in the Gemfile) are used:

```bash
bundle exec rake db:setup
```

### Step 5: Run the tests

Now you're ready to run the tests:

```bash
bundle exec rake spec
```

Discuss any errors with the team on Slack, in a scrum, or in mob or pair programming.

### Step 6. Start the server

```bash
bundle exec rails s
```

You can now see the system working on your local development environment by querying the [GraphQL api](http://localhost:3000/graphiql)

Be sure to read and understand [how to contribute](../CONTRIBUTING.md) when you're ready to start developing and contributing.

## Code Style

We recommend and follow the [Ruby Style Guide](https://github.com/rubocop-hq/ruby-style-guide)

[Here are notes about comments and altering other's code.](code_style_conventions.md)

[Note: This page originally at https://github.com/AgileVentures/WebsiteOne/wiki/Project-Setup-%28New-Users%29]
