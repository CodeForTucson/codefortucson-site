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
* [SASS](http://sass-lang.com)

You should be able to install them via [RubyGems](https://rubygems.org). GitHub has built a meta package which pulls in all of these dependencies:

    $ gem install github-pages

If you want more information on getting started with Ruby development, STOP RIGHT THERE.  Use RVM instead.  If you're still using Ruby in 6 months, you'll thank us profusely.

#### Optimizing the assets

We depend on a couple of tools to optimize the assets during the build process and you will need to make sure that they are installed.

 * `ImageMagick` - used to resize images
 * `jpegoptim` - used to optimize JPEG images
 * `pngcrush` - used to optimize PNG images

If you are running OSX, you can use [brew](brew.sh) to install these packages.

```bash
brew install imagemagick jpegoptim
```

## Local development and hacking

In order to run this website in your local environment, you will need to have **Jekyll** serve it. GitHub Pages (the host of [codefortucson.org](codefortucson.org)) has some strange requirements on the base URL for its sites. Before we can run and test locally, we need to overwrite the corresponding settings. Thankfully, we can do this by simply appending the local development config file to the **Jekyll** command, which is done for you already in the **Makefile**.

```bash
make
```

That's all it takes! Now you have a running Jekyll server on your local machine that will automatically watch for changes to the source files and update accordingly in response.

_If you are using RVM, make sure you are using the correct Gemset!_

    $ rvm use 2.0.0@codefortucson

You should now be able to visit [http://localhost:4000/](http://localhost:4000/) in your browser and see a copy of the Code for Tucson site hosted on your very own computer that updates when you save something! Zoiks!

###To make changes:
+ Clone the repository on your computer with `git clone [https or ssh repo url]`. You can find this on GitHub as the **Clone URL**.
+ Create a new branch to work on your addition, bug-fix, or feature with `git checkout -b [name of new branch]`. Try to use names that describe what you are accomplishing, such as `add/hackathon-project-info`, `fix/wrong-meeting-time`, or `new/funny-cat-video-page`.
+ Always leave [useful commit messages](https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message). Taking the time to explain your changes will help you to better understand your work and will prevent accidental mishaps.
+ When you beieve that your changes are ready for production, create a pull request with a thorough description of the changes. Include before and after screenshots or testing instructions so that someone can review the changes before merging into `master`.
+ If you accidentally merge into `master`, it's okay - GitHub renders the site from the `gh-pages` branch. Only stable releases from `master` should ever be merged into `gh-pages`.

Getting started with **git** can be confusing if you haven't worked with it before. If this describes how you feel, check out [a non-programmers intro to **git**](http://blog.scottlowe.org/2015/01/14/non-programmer-git-intro/), then [the simple guide](http://rogerdudler.github.io/git-guide/) for an overview of a **git** workflow, and Code School's [interactive **git** tutorial](https://try.github.io/levels/1/challenges/1).

#### Hacking images

Save high-resolution or high-quality images inside the `source_assets/images` folder and don't worry about optimizing them. Reference those images as if you had saved them inside the `assets/images` folder. Each time you generate the site, the build script will copy over any new or changed images into the `assets/images` folder, maintaining the directory structure, and optimized the images for you.

Make sure to build the site before checking in and add the new image itself as well as its optimized counterpart into your `git` commit. If you only need to generate the images, you can run `make optimized-images` instead of `make`.

For example, if you wanted to add a new image called `MiceAndMen.jpg` to the project, here's what you would do:

+ Decide if you want the image to display at a specific size. The build script will allow us to store a full-resolution source and still trim it down each time we generate the site. In this case, let's say we will want the final image to be 400px wide.
+ If setting a final image size, save the image with a dash and then the size before the image extension:
	+ `MiceAndMen.jpg` - Keep the size the same as in the source image (actually, this limits the largest dimension to 1600 pixels to keep a sane size)
	+ `MiceAndMen-400.jpg` - Scale so that the width will be 400px (maintain aspect ratio)
	+ `MiceAndMen-x200.jpg` - Scale so that the height will be 200px (maintain aspect ratio)
	+ `MiceAndMen-400x200.jgp` - Scale and force into 400x200px size (butchers aspect ratio)
+ Save that image in the source directory:
```html
source_assets/images/MiceAndMen-400.jpg
```
+ Reference the image in your blog or page as if it were in the final assets directory:
```html
<img src="{{ site.baseurl }}/assets/images/MiceAndMen-400.jpg" />
```
+ Run the build script `make` or just the asset generator `make optimized-images` and it will transfer the high-quality source images into their optimized counterparts.

###Special pages:
+ Press page uses /data/press.csv to populate its press listing (but not the press releases, which are hard-coded)
+ Projects page uses /data/projects.csv to populate the projects listing.
+ Blog pages are built programmatically using Jekyll from the entries in the /blog/_posts directory.  There is similar content in the /blog/drafts directory, but these entries are working copies only that are not displayed on teh public website.
