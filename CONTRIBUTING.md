# Guide to Submitting CSL Styles (and Locales)

The CSL style repository is the central location on the web for collecting
and maintaining CSL styles. Software like Zotero, Mendeley, and Papers draw
their styles directly from our repository.

We welcome style submissions (and corrections), and are particularly
interested in styles for journals and published style guides. If you
wish to submit a different type of style, please first check our
[Criteria for Accepting Styles](https://github.com/citation-style-language/styles/wiki/Criteria-for-Accepting-Styles).

To submit a style, please follow the following steps:

1. Check that your style meets all our [style
requirements](https://github.com/citation-style-language/styles/wiki/Style-Requirements).

2. [Validate](https://github.com/citation-style-language/styles/wiki/Validation)
your style against the CSL schema, and correct any validation errors.

3. Submit the style.

    The fastest way to get a style accepted into our repository is by creating
    a **pull request** on the GitHub website. To start, create a GitHub.com
    account and sign in.

    Then, if you're *submitting a new style*, see the instructions on [Creating
    new files](https://help.github.com/articles/creating-new-files). In short,
    the steps involve:

    1. Visit https://github.com/citation-style-language/styles and click the
    plus icon (with a "Fork this project and create a new file" tooltip).
    When submitting a dependent style, first navigate to the
    [dependent](https://github.com/citation-style-language/styles/tree/master/dependent)
    subdirectory.
    2. Write the file name of the style in the "Name your file..." text field.
    Make sure to add a ".csl" extension, e.g. "journal-of-results.csl".
    3. Paste the style code into the code editor window.
    4. Click the "Propose new file" button.
    5. In the next window, describe the changes you've made. When finished,
    click the "Send pull request" button.

    If you're *submitting changes to an existing style* instead, see the
    instructions on [Editing files in another user's
    repository](https://help.github.com/articles/editing-files-in-another-user-s-repository).
    Here the steps are:

    1. Visit https://github.com/citation-style-language/styles and find the
    style you wish to change (dependent styles are stored in the
    [dependent](https://github.com/citation-style-language/styles/tree/master/dependent)
    subdirectory). To search by file name, press "t" to activate GitHub’s [File
    Finder](https://github.com/blog/793-introducing-the-file-finder) and start
    typing.
    2. Click on the style name, which will bring you to a page like
    https://github.com/citation-style-language/styles/blob/master/apa.csl.
    3. Click the edit icon. This opens a code editor in which you can make your
    changes (you can for example copy and paste your modified style into this
    window).
    4. Once you have made your changes in the "Code" tab (and previewed the
    changes in the "Preview" tab), click the "Propose file change" button.
    5. In the next window, describe the changes you've made. When finished,
    click the "Send pull request" button.

    Instead of relying solely on the GitHub website, you can also use a git
    client, such as [GitHub for Mac](http://mac.github.com/), [GitHub for
    Windows](http://windows.github.com/), or
    [SmartGit](http://www.syntevo.com/smartgit/index.html). When using a client,
    [fork](http://help.github.com/fork-a-repo/) the [style
    repository](https://github.com/citation-style-language/styles), create a
    feature branch, commit your changes, and then create a [pull
    request](http://help.github.com/send-pull-requests/).

4. Check on your pull request.

    After you create a pull request, tests are automatically run to verify that
    your style validates and follows our style requirements.

    These **Travis CI** tests usually finish within a few minutes. If Travis CI
    finds no problems, a green checkmark will appear in your pull request.
    Otherwise, you will see a red X. Click this X to see the build report, which
    describes the identified errors. If you have trouble figuring out what's
    wrong with your pull request, post a comment in the pull request and ask
    for help. When Travis CI finds problems with your style, don't create a new
    pull request. Instead, correct the existing one (see below).

    We also have a handful of volunteers who review pull requests. We will
    often ask you to provide some extra information about the style you're
    submitting, or ask you to make some changes to your pull request. Once we
    are satisfied, we will **merge** the pull request.

    Sometimes we merge pull requests within the hour, and sometimes it takes a
    few days. This depends on how busy we are, and on the time it takes to get
    your style is acceptable shape. In general, the closer you follow our
    instructions detailed here, the faster we can accept your style.

5. Update your pull request.

    To make changes to your pull request, visit the "Files changed" tab of your
    pull request, and then click the "View" button at the top of your style.
    This should bring you to the copy of the style in your own fork of the
    styles repository. Finally, click on the edit icon, and make your changes.

    Any changes made this way will automatically appear in the pull request, and
    each commit will trigger a new Travis CI report.

    We don't get email updates when you make changes to your pull request, so
    create a comment in the pull request if you wish to alert us.

6. Make additional changes after your pull request has been merged.

    Once a pull request has been merged, it can no longer be used to submit
    further changes. If you do wish to make additional changes, create a new
    pull request. Please always start from the latest version of the style from
    our repository, because we often perform maintenance on styles.

The steps to submit locale files are largely the same, except that locales
need to be submitted to the
[locales](https://github.com/citation-style-language/locales) repository.
