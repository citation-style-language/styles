CSL Style Repository
====================

![Merge to release](https://github.com/citation-style-language/styles/workflows/Merge%20to%20release/badge.svg?event=push)
[![license](https://img.shields.io/badge/license-CC%20BY%20SA%203.0-blue.svg)](https://github.com/citation-style-language/styles#licensing)
[![GitHub contributors](https://img.shields.io/github/contributors/citation-style-language/styles.svg)](https://github.com/citation-style-language/styles/graphs/contributors)
[![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed/citation-style-language/styles.svg)](https://github.com/citation-style-language/styles/pulls?q=is%3Apr+is%3Aclosed)

https://github.com/citation-style-language/styles/ is the official repository for [Citation Style Language](https://citationstyles.org/) (CSL) styles and is maintained by CSL project members. CSL locale files, which provide default localization data for CSL styles (such as translations and date formats), are available at https://github.com/citation-style-language/locales.

For more information, check out https://citationstyles.org/ and the [repository wiki](https://github.com/citation-style-language/styles/wiki).

Organization and distribution
-----------------------------

We currently only actively maintain CSL styles in the "master" branch for the latest released version of CSL.

To provide a stable location for styles of a given CSL version, styles in "master" are automatically copied to the appropriate version branch (e.g. branch "v1.0.1" when CSL 1.0.1 is the latest version).
Once a new version of CSL is released (e.g. CSL 1.0.2), "master" will upgrade to that version, after which styles will be copied from "master" to a new version branch ("v1.0.2").
Version branches for old versions of CSL are kept but typically become dormant, as for these branches we generally stop maintenance, won't accept third-party contributions via pull requests, nor backport changes made to styles in "master".

Starting with branch "v1.0.1", the version branches differ from "master" in the following ways:

* the latest version branch only receives updates from "master" if all tests in "master" pass
* `<updated/>` timestamps of styles in the version branch are changed to match the git modification date of each individual style in "master"
* superfluous files present in "master", e.g. for style testing, are removed.

As such, especially for downstream integrators, users are encouraged to obtain their CSL styles from the appropriate version branch (e.g. "v1.0.1" for CSL 1.0.1 styles).
The same release regimen is used for our [CSL locales](https://github.com/citation-style-language/locales).

As of November 2020, https://github.com/citation-style-language/styles-distribution, which fulfilled a similar role to the version branches, has been deprecated and no longer receives updates from https://github.com/citation-style-language/styles.

Licensing
---------

All the styles in this repository are released under the [Creative Commons Attribution-ShareAlike 3.0 Unported license](http://creativecommons.org/licenses/by-sa/3.0/).
For attribution, any software using CSL styles from this repository must include a clear mention of the CSL project and a link to [CitationStyles.org](http://citationstyles.org/). When distributing these styles, the listings of authors and contributors in the style metadata must be kept as is.
