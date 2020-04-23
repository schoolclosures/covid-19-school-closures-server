nstall the app on your local machine.

Fork and clone the app to your local machine, use this guide if you don't know how to do that

Set the upstream remote so you can keep your copy of the app synced with the original. To do that go to your terminal and cd into your cloned odin project app directory. Then use one of the following commands:

If you have ssh set up with Git

$ git remote add upstream git@github.com:schoolclosures/covid-19-school-closures-server.git
Otherwise

$ git remote add upstream https://github.com/schoolclosures/covid-19-school-closures-server.git
Use one of the following operating system specific guides to set up the Odin Project app on your machine:

Linux installation guide
Mac installation guide
Before you start working on your issue create a branch and name it like the following examples:
If its a new feature

$ git checkout -b feature/new-feature-name`
If its a bug fix

$ git checkout -b fix/fixed-bug-name
When you have finished and are ready to submit a Pull request:
Before you submit your pull request ensure all the tests pass

$ rspec
Push your branch to your fork

$ git push origin <your branch name here>
Create a pull request

Go to your fork on Github after you have pushed up your branch. A new button should be visible near the top of the page. It will allow you to create a pull request to the original School Closures Server Repo.

Please a detailed description for your pull request .
