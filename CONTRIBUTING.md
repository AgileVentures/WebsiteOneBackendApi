# Contributing to WebSiteOneBackendApi (WSO)

So you'd like to contribute to the WebSiteOneBackendApi codebase?  That's wonderful, we're excited to have your help :-)

Please do come and say hello in our [Slack chat](https://agileventures.slack.com/messages/websiteone). You can get an invite by signing up at [AgileVentures](https://www.agileventures.org) or emailing [info@agileventures.org](mailto:info@agileventures.org).  We have [weekly meetings](https://www.agileventures.org/events/websiteone-planning) to coordinate our efforts and we try to do planning poker voting on tickets before starting work on them.  Feel free to join any [AgileVentures daily scrum](https://www.agileventures.org/events/) to ask questions, to listen in, or just say hi :-)

## Getting Started

This describes how to contribute to WebSiteOneBackendApi:  the tools we use to track and
coordinate the work that is happening and that needs to happen. This also describes the
*workflow* -- the processes and sequences for getting contributions merged into the project in an organized and coherent way.

First be sure that you've set up your development environment following all the steps
 in **[Setting Up for Development on WebSiteOneBackendApi _(Project Set Up)_](https://github.com/AgileVentures/WebsiteOneBackendApi/blob/develop/docs/project_setup.md)**

We keep our code on [GitHub](http://github.com) and use [git](https://git-scm.com) for version control.


## General Steps
To get involved please follow these steps:

#### 1. Get the system working on your development environment:

   1. [install WSO on your dev environment (laptop or c9)](https://github.com/AgileVentures/WebsiteOneBackendApi/blob/develop/docs/project_setup.md)

   2. get tests passing (unit tests in `spec/`)

   3. check that the site can be run manually (locally)

   4. (optional) deploy to a remote (e.g. Heroku, drie etc.) and ensure it runs there

#### 2. Look at what needs to be done on GitHub

* review [open PRs](https://github.com/AgileVentures/WebsiteOneBackendApi/pulls) on GitHub - leave comments or collaborate if interested


#### 3. Look at what needs to be done on [our zenhub project board:](https://app.zenhub.com/workspaces/websiteonebackendapi-5d461bfde27a7b3dba9112a3/board?repos=191386247)

  1. look through **[New issues](https://app.zenhub.com/workspaces/websiteonebackendapi-5d461bfde27a7b3dba9112a3/board?repos=191386247)** column - feel free to start work, but always interested to hear chat in slack, scrum wherever


  2. look at **[backlog](https://app.zenhub.com/workspaces/websiteonebackendapi-5d461bfde27a7b3dba9112a3/board?repos=191386247)** - if there is an interesting ticket get it voted on in a scrum or do an [ASYNC Vote](https://github.com/AgileVentures/AgileVentures/blob/master/ASYNC_VOTING.md) in Slack

##### Voting

  Items need to be voted on before work can start.  Voting happens in scrums or the weekly meeting.  Note that even without the meetings you can get a vote on any issue you're thinking of working on by using the Async voting bot in the [#websiteone slack channel](https://agileventures.slack.com/messages/C029E8G80/details/), using the following syntax: `/voter ISSUE NAME https://github.com/AgileVentures/WebsiteOneBackendApi/issues/number`.

e.g. 

```
/voter make a press-kit link in the footer https://github.com/AgileVentures/WebsiteOneBackendApi/issues/1738
```

More on how to handle a vote can be found at: https://github.com/AgileVentures/AgileVentures/blob/master/ASYNC_VOTING.md#automated-async-vote

## git and GitHub
Our **default working branch is `develop`**.  We do work by creating branches off `develop` for new features and bugfixes.

Any *feature* should include appropriate RSpec unit tests.

A *bugfix* may include a unit test depending on where the bug occurred, but fixing a bug should start with the creation of a test that replicates the bug, so that any bugfix submission will include an appropriate test as well as the fix itself.

Each developer will usually work with a [fork](https://help.github.com/articles/fork-a-repo/) of the [main repository on Agile Ventures](https://github.com/AgileVentures/WebSiteOneBackendApi). Before starting work on a new feature or bugfix, please ensure you have [synced your fork to upstream/develop](https://help.github.com/articles/syncing-a-fork/):

```
git pull upstream develop
```

Note that you should be re-syncing daily (even hourly at very active times) on your
feature/bugfix branch to ensure that you are always building on top of very latest develop code.

### Pull Requests: naming, syncing, size
Here is [how to create and submit a pull requests](https://github.com/AgileVentures/WebsiteOneBackendApi/blob/docs/how_to_submit_a_pull_request_on_github.md).

Every pull request should refer to a corresponding GitHub issue, and when you create feature/bug-fix branches please include the id of the relevant issue, e.g.

```
git checkout -b 799_add_contributing_md
```

Please ensure that each commit in your pull request makes a single coherent change and that the overall pull request only includes commits related to the specific GitHub issue that the pull request is addressing.  This helps the project managers understand the PRs and merge them more quickly.

Whatever you are working on, or however far you get please do open a "Work in Progress" (WIP) [pull request](https://help.github.com/articles/creating-a-pull-request/) (just prepend your PR title with "[WIP]" ) so that others in the team can comment on your approach.  Even if you hate your horrible code :-) please throw it up there and we'll help guide your code to fit in with the rest of the project.


Before you make a pull request it is a great idea to sync again to the upstream develop branch to reduce the chance that there will be any merge conflicts arising from other PRs that have been merged to develop since you started work:

```
git pull upstream develop
```

In your pull request description please include a sensible description of your code and a tag `fixes #<issue-id>` e.g. :

```
This PR adds a CONTRIBUTING.md file and a docs directory

fixes #799
```

which will associate the pull request with the issue in the Waffle board.

This all adds up to a work flow that should look something like this:

0) ensure issue has full description of change and has been voted on
1) create branch prefixed with id of issue (moves issue into 'in progress')  
2) create failing test on the branch (acceptance level)  
3) create failing tests (unit level)  
4) get test to pass with functionality  
5) submit pull request with fixes #xyz   
6) pull request reviewed  
7) changes to original PR if required  
8) pull request merged (presence of "fixes #xyz" then moves issue to 'done')
9) code moved to staging and checked against production data clone
10) code moved to production


Pull Request Review
-------------------

Currently https://github.com/tansaku is project managing WebSiteOneBackendApi.  The project manager will review your pull request as soon as possible.  Usually the project manager will need to sign off in order to merge a pull request.

The project manager will review the pull request for coherence with the specified feature or bug fix, and give feedback on code quality, user experience, documentation and git style.  Please respond to comments from the project managers with explanation, or further commits to your pull request in order to get merged in as quickly as possible.

To maximize flexibility add the project manager as a collaborator to your WebSiteOneBackendApi fork in order to allow them to help you fix your pull request, but this is not required.

If your tests are passing locally, but failing on CI, please have a look at the fails and if you can't fix, please do reach out to the project manager.


