# Submitting Styles

Before submitting a style for inclusion in the style repository, make sure that
your (modified) style
[validates](https://github.com/citation-style-language/styles/wiki/Validation)
and meets all our [style
requirements](https://github.com/citation-style-language/styles/wiki/Style-Requirements).

There are three ways to submit styles. When you want to submit corrections or
improvements to an existing style, please create a pull request using either the
GitHub website (option A) or a git client (option B; for advanced users). If you
have difficulty figuring out options A and B, you can create a gist instead
(option C). When submitting a new style, use option C or, preferably, B.

We use an automated system for quality control of the style repository (for
details, see
[Test-Environment](https://github.com/citation-style-language/styles/wiki/Test-Environment)).
After each commit, the [Travis
CI](http://travis-ci.org/#!/citation-style-language/styles) service checks all
the styles in the repository. Checks include validation against the CSL schema,
but also cover additional requirements specific to our style repository (such as
the license under which styles are released). Whenever you create a pull request
(via options A or B), Travis CI will automatically test the pull request (even
before it gets merged) and include the test results in the pull request (see the
[Travis announcement]
(http://about.travis-ci.org/blog/2012-09-04-pull-requests-just-got-even-more-awesome/)).

## (A) Edit a Style using the GitHub Website
_Note that this method is only suited for corrections or improvements of
existing styles. When you want to submit a new style - even if it contains only
small modifications relative to the style it was derived from - see (B) or (C)
below._

1. Create a GitHub.com account and sign in.
2. Go to https://github.com/citation-style-language/styles, and find the style
you want to change (dependent styles are stored in the "dependent" directory)
3. Click on the style name, which will bring you to a page like
https://github.com/citation-style-language/styles/blob/master/apa.csl
4. Click the "Fork and edit this file" button. This will open a code editor,
allowing you to make your changes (e.g. you can copy and paste your modified
style into this window).
5. Once you have made your changes in the "Code" tab, and previewed them in the
"Preview" tab, click the "Propose File Change" button.
6. In the next window, provide a description of the changes you've made. When
finished, click "Send pull request".

Based on your GitHub notification settings, you will now automatically receive
updates when your changes have been accepted, or when the CSL team has comments
or questions about your changes.

See also https://github.com/blog/844-forking-with-the-edit-button

## (B) Use a git Client

Start by [forking](http://help.github.com/fork-a-repo/) the [style
repository](https://github.com/citation-style-language/styles). Commit your
changes, and create a [pull
request](http://help.github.com/send-pull-requests/). You can use your git
client of choice, such as [GitHub for Mac](http://mac.github.com/), [GitHub for
Windows](http://windows.github.com/), or
[SmartGit](http://www.syntevo.com/smartgit/index.html).

## (C) Create a 'gist'

Visit http://gist.github.com, and paste the style code into the text box. Give
the style a name ("name this file...") and click the "Create Public Gist"
button. Copy the URL of the gist (e.g. https://gist.github.com/1320111), and
include it in your message to us. You can either start a new discussion in the
[Citation Styles section of the Zotero forums](http://forums.zotero.org/11/), or
[create a new GitHub
issue](https://github.com/citation-style-language/styles/issues/new) in the
_styles_ repository.