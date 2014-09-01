Code For Tucson Website
=============

This is the repository for the website for Code for Tucson, the Tucson chapter of the Code for America Brigade program. It is based on the website for [Code for DC](http://www.codefordc.org).

This site is built on Github Pages, which uses [Jekyll](http://jekyllrb.com/) as a templating language.

##Compiling and publishing changes

We depend on a few Ruby gems:

* `gem install jekyll`
* `gem install kramdown`

We also depend on Sass:

* `gem install sass`

To keep our code updating continuously as we edit, we use `jekyll serve --baseurl '' --watch`. As of Jekyll 2.2.0, [gh-pages compiles Sass natively](https://github.com/blog/1867-github-pages-now-runs-jekyll-2-2-0). You no longer have to watch your Sass files separately from running Jekyll.

###To make changes:
+ You should set up a local copy of the site and test your changes there before pushing them back to the repository to make sure everything is good to go.
+ Work against the Master branch.  Master == Staging.
+ The production website is hosted off of the 'gh-pages' branch.  You shouldn't work against this, but when you have publication-ready changes in Master, you can pull those across to gh-pages to make them live. The reason for maintaining separate master and gh-pages branches is that it enables people to work against a shared master branch and merge back to it without needing to make the code ready for production first.


Special pages:
+ Press page uses /data/press.csv to populate its press listing (but not the press releases, which are hard-coded)
+ Projects page uses /data/projects.csv to populate the projects listing.
+ Blog pages are built programmatically using Jekyll from the entries in the /blog/_posts directory.  There is similar content in the /blog/drafts directory, but these entries are working copies only that are not displayed on teh public website.


