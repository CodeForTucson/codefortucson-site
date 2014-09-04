Code For Tucson Website
=======================

This is the repository for the website for Code for Tucson, the Tucson chapter of the Code for America Brigade program. It is based on the website for [Code for DC](http://www.codefordc.org).

This site is built on Github Pages, which uses [Jekyll](http://jekyllrb.com/) as a templating language.

##Dependencies

###RVM Gemset [Recommended]

    # Install Ruby 2.0.0
    $ rvm install 2.0.0
    
    # Create and use the Code for Tucson Gemset
    $ rvm use 2.0.0@codefortucson --create
    
    # Install the dependencies
    $ bundle install

###Manual Install [Not supported]

We depend on a few Ruby gems:

* [Jekyll](http://jekyllrb.com)
* [Kramdown](http://kramdown.gettalong.org)
* [SASS](http://sass-lang.com)

You should be able to install them via [RubyGems](https://rubygems.org):

    $ gem install jekyll kramdown sass

If you want more information on getting started with Ruby development, STOP RIGHT THERE.  Use RVM instead.  If you're still using Ruby in 6 months, you'll thank us profusely.

##Hacking

###Update the configuration file

Look for the `url` key in `_config.yml`.  Uncomment the local development line before starting local development, and **please remember to comment it back out before submitting pull requests**.

###Run `jekyll`

_If you are using RVM, make sure you are using the correct Gemset!_
    
    $ rvm use 2.0.0@codefortucson

Start the local web server

    $ jekyll -b '' -w

You should now be able to visit http://localhost:4000/ in your browser and see a copy of the Code for Tucson site hosted on your very own computer that updates when you save something! Zoiks!

###To make changes:
+ You should set up a fork of the site and test your changes there before submitting a pull request.
+ Please work against the `master` branch.  `master == staging`.
+ The production website is hosted off of the `gh-pages` branch.  You shouldn't work against this, but when you have publication-ready changes in `master`, you can pull those across to `gh-pages` to make them live. This enables people to work against a shared `master` branch without needing to ensure production-ready commits.
+ If you have questions about contributing to an upstream repository with Github's fork workflow, read more on [forking repos](https://help.github.com/articles/fork-a-repo) and [syncing forks](https://help.github.com/articles/syncing-a-fork).


<!-- ###Special pages:
+ Press page uses /data/press.csv to populate its press listing (but not the press releases, which are hard-coded)
+ Projects page uses /data/projects.csv to populate the projects listing.
+ Blog pages are built programmatically using Jekyll from the entries in the /blog/_posts directory.  There is similar content in the /blog/drafts directory, but these entries are working copies only that are not displayed on teh public website. -->


