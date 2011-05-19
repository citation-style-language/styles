# Introduction

This is a repository of Citation Style Language (CSL) 1.0 styles. For more
information about the CSL project, see http://citationstyles.org.

# Guidelines for Submitting Styles

We welcome contributions to the style repository. Please help streamlining the
process by following these guidelines:

## Forking

The preferred way to make contributions is to:

1. fork the main repository
2. create a temporary development branch and make your changes there
3. commit your changes in one atomic commit per style in the master branch
4. issue a pull request to the main repository

Small edits can also be made via the github.com interface (see
https://github.com/blog/844-forking-with-the-edit-button). Alternative, if git
is not your thing, you can also create a gist of the (modified) style
(https://gist.github.com/) and post its URL to the Zotero forums
(http://forums.zotero.org/11/).

## Validation

Before submitting your (modified) style, make sure that it validates against the
CSL 1.0 schema.

## Licensing

New styles should preferably be licensed under the CC-BY-SA license.

## Choosing File Names, Style IDs and Self-Links

The file name of every CSL style must:

* be all lower case
* contain no characters other than digits (0-9), letters (a-z), and single
  dashes (-)
* end with a ".csl" extension

Style IDs (and the "self" link for independent styles) should consist of the
string "http://www.zotero.org/styles/" followed by the file name minus the
".csl" extension. E.g. for the style "apa.csl":

    <id>http://www.zotero.org/styles/apa</id>
    <link href="http://www.zotero.org/styles/apa" rel="self"/>

## XML Indenting

Styles should preferably be indented with 2 spaces per level.
