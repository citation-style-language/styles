# Submitting Styles

**Before submitting styles to our repository, please make sure that they
[validate](https://github.com/citation-style-language/styles/wiki/Validation)
and meet our other
[requirements](https://github.com/citation-style-language/styles/wiki/Style-Requirements).**

The preferred way to submit styles is to create a *pull request*. This can be
done via the GitHub.com website (option A, see instructions below), or by using
the website in combination with a Git client (option B). The latter gives
greater flexibility, such as the ability to submit multiple styles with a single
pull request. Finally, if you have trouble figuring out options A and B, you can
also create a *gist* on the GitHub website (option C).

Styles submitted via a pull request are automatically validated and checked for
additional requirements. For this we rely on a
[Test-Environment](https://github.com/citation-style-language/styles/wiki/Test-Environment)
set up at
[Travis-CI.org](http://travis-ci.org/#!/citation-style-language/styles). A few
minutes after creating a pull request, Travis CI will generate a test report
(see the [Travis blog]
(http://about.travis-ci.org/blog/2012-09-04-pull-requests-just-got-even-more-awesome/)).
If there are any problems, the report will describe what is wrong.

## (A) Pull Request - GitHub Website Only

If you wish to **add** a new style:

1. Create a GitHub.com account and sign in.
2. Go to https://github.com/citation-style-language/styles and click the plus
button (with a "Fork this project and create a new file" tooltip, see [Creating
files on GitHub](https://github.com/blog/1327-creating-files-on-github)). If you
wish to submit a dependent style, first navigate to the "dependent" directory.
3. Name your new style. Use the file name including the ".csl" extension, e.g. "journal-of-results.csl".
4. Paste the style code into the code editor window.
4. Click the "Propose New File" button.
5. In the next window, describe the changes you've made. When
finished, click the "Send pull request" button.

If you wish to **edit** an existing style:

1. Create a GitHub.com account and sign in.
2. Go to https://github.com/citation-style-language/styles, and find the style
you want to change (dependent styles are stored in the "dependent" directory).
3. Click on the style name, which will bring you to a page like
https://github.com/citation-style-language/styles/blob/master/apa.csl.
4. Click the "Edit" button (see [Forking with the Edit
Button](https://github.com/blog/844-forking-with-the-edit-button). This will
open a code editor in which you can make your changes (e.g. you can copy and
paste your modified style into this window).
5. Once you have made your changes in the "Code" tab (and previewed the changes
in the "Preview" tab), click the "Propose File Change" button.
6. In the next window, describe the changes you've made. When
finished, click the "Send pull request" button.

Based on your GitHub notification settings, you will now automatically receive
updates when your changes have been accepted, or when the CSL team has comments
or questions about your changes.

## (B) Pull Request - GitHub Website and Git Client

Start by [forking](http://help.github.com/fork-a-repo/) the [style
repository](https://github.com/citation-style-language/styles). Commit your
changes, and create a [pull
request](http://help.github.com/send-pull-requests/). You can use your git
client of choice, such as [GitHub for Mac](http://mac.github.com/), [GitHub for
Windows](http://windows.github.com/), or
[SmartGit](http://www.syntevo.com/smartgit/index.html).

## (C) Creating a gist

Visit http://gist.github.com and paste the style code into the text box. Give
the style a name ("name this file...") and click the "Create Public Gist"
button. Copy the URL of the gist (e.g. https://gist.github.com/rmzelle/1320111) and
include it in your message to us. You can either start a new discussion in the
[Citation Styles](http://forums.zotero.org/11/) section of the Zotero forums, or
[create a new GitHub
issue](https://github.com/citation-style-language/styles/issues/new) in the
_styles_ repository.

Gists have to be checked by hand and take longer to get accepted, so please try
option A first.
