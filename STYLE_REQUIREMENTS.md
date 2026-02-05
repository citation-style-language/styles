# CSL Style Repository Requirements

Before submitting your style to the CSL style repository, please make sure it follows our requirements:

## 1 - Title

The style name in `<title/>` should provide the official title of the style manual, journal, or publisher that issues the guidance. Where a style guide provides multiple referencing systems or variants, add the variant in parentheses:

```xml
<title>MHRA Style Guide 4th edition (author-date)</title>
```

```xml
<title>MHRA Style Guide 4th edition (notes)</title>
```

Store a title abbreviation and terms for which users are likely to search in the `<title-short/>` element:

```xml
<title>Chicago Manual of Style 18th edition (author-date, without URLs)</title>
<title-short>CMOS with Bluebook (author-date/AD [13.102], no URLs [13.6])</title-short>
```

The keywords provided here mean, for example, that a search in the repository for `Chicago AD` will return this style.

### Journal Styles

The title of a journal style should be the publication's full name, including any subtitles.

```xml
<title>Hortus Artium Medievalium: Journal of the International Research Center for Late Antiquity and Middle Ages</title>
<title-short>HAM</title-short>
```

### Institutional Styles

A style for a specific publisher or university should include the institution name, any department name, and the title of the parent style (such as "APA" or "MLA"), separated by hyphens:

```xml
<title>Université de Montréal - APA (Français - Canada)</title>
```

If an organization publishes independent style sheets for different citation systems, use the same convention as for a style guide with multiple variants:

```xml
<title>Uludağ Üniversitesi - Sosyal Bilimler Enstitüsü (author-date, Türkçe)</title>
```

```xml
<title>Uludağ Üniversitesi - Sosyal Bilimler Enstitüsü (full note, Türkçe)</title>
```

## 2 - Title Diacritics

Don't remove diacritics from the style title.
For example, use `<title>Associação Brasileira de Normas Técnicas</title>` instead of `<title>Associacao Brasileira de Normas Tecnicas</title>`.

## 3 - Style Locale

If your style is meant to be used in one particular language, set the `default-locale` attribute on `<style/>` to the appropriate locale code.
For example, CSL styles for English-language journals should typically be set to US English (`en-US`) or British English (`en-GB`).
For a list of languages and their locale codes, see https://github.com/citation-style-language/locales/wiki.

If you set `default-locale` to a language other than English (`en-*`), add the language to the end of the style title in parentheses.

Two examples:

```xml
   <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0" default-locale="de-DE">
     <info>
       <title>Zeitschrift für Soziologie (Deutsch)</title>
       <id>http://www.zotero.org/styles/zeitschrift-fur-soziologie</id>
     </info>
   </style>
```

```xml
   <style xmlns="http://purl.org/net/xbiblio/csl" class="in-text" version="1.0" default-locale="pt-BR">
     <info>
       <title>Associação Brasileira de Normas Técnicas (Português - Brasil)</title>
       <id>http://www.zotero.org/styles/associacao-brasileira-de-normas-tecnicas</id>
     </info>
   </style>
```

## 4 - File Name

The file name of a style should be based on its title.
However, file names may only contain lowercase roman letters (a-z), digits (0-9), and single hyphens (-), and must end with the `.csl` extension.
To create the file name from the title:

  * replace capitals with lowercase letters
  * replace ampersands with "and" (e.g. "Arts & Health" becomes `arts-and-health.csl`)
  * replace spaces and apostrophes with hyphens (e.g. "Documents d'archéologie française (French)" becomes `documents-d-archeologie-francaise.csl`)
  * drop diacritics (e.g. "bibliothèque" becomes "bibliotheque"); do not replace diacritics with other letter combinations (e.g. "für" becomes "fur", not "fuer")
  * drop text between parentheses, unless it is necessary for disambiguating two styles (e.g. "Ugeskrift for Læger (Danish)" becomes `ugeskrift-for-laeger.csl`)
  * use the title of the source without subtitles, using abbreviations only where they form part of the published name (e.g. `modern-language-review.csl` for the journal published as *Modern Language Review*, though commonly cited as *MLR* within its field; `chicago-author-date.csl` for the *Chicago Manual of Style*, author–date system)
  * add the `.csl` extension

You can use a 'slugify' tool like https://blog.tersmitten.nl/slugify/ to quickly lowercase titles and replace spaces by hyphens, although you may have to make some more changes by hand.

## 5 - Style ID

The style ID must be `http://www.zotero.org/styles/file-name`, with `file-name` representing the style's file name without the `.csl` extension.
For example, the style ID for `chicago-notes.csl` is `http://www.zotero.org/styles/chicago-notes`:

```xml
   <info>
     <id>http://www.zotero.org/styles/chicago-notes</id>
   </info>
```

## 6 - `self` Link

The style's `self` link, which tells where the style will available online, must be `http://www.zotero.org/styles/file-name`, with `file-name` representing the style's file name without the `.csl` extension.
For example, `http://www.zotero.org/styles/chicago-notes` for `chicago-notes.csl`:

```xml
   <info>
     <link href="http://www.zotero.org/styles/chicago-notes" rel="self"/>
   </info>
```

## 7 - License

The style must be licensed under the Creative Commons Attribution-ShareAlike 3.0 License.
Use the exact text below, without any hard line breaks for `<rights/>`:

```xml
   <info>
     <rights license="http://creativecommons.org/licenses/by-sa/3.0/">This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License</rights>
   </info>
```

## 8 - `template` Link

If you started from another CSL style, delete the original style authors and contributors, and point to the original style with a `template` link:

```xml
   <info>
     <link href="http://www.zotero.org/styles/original-style" rel="template"/>
   </info>
```

## 9 - ISSN and eISSN

Journal styles should list the journal's print ISSN (``<issn/>``) and online ISSN (``<eissn/>``), if available:

```xml
   <info>
     <issn>0028-0836</issn>
     <eissn>1476-4687</eissn>
   </info>
```

## 10 - `documentation` Link

Independent styles should have a `documentation` link that points to a description of the style's citation format.
For journals, this is typically the "instructions to authors" webpage.
If a style guide is only available in print, provide a URL that allows us to locate a paper copy.

```xml
   <info>
     <link href="https://www.mhra.org.uk/style/" rel="documentation"/>
   </info>
```

## 11 - Categories

Adding [CSL subject categories](https://docs.citationstyles.org/en/stable/specification.html#appendix-i-categories) to your style enables users to find it more easily.
For example, if your style is for a journal in the field of history, add:

```xml
   <category field="history"/>
   <category field="humanities"/>
```

The `generic-base` category is for styles used across multiple institutions and publishers, such as APA or Chicago, and should be removed from derivative styles.

## 12 - Authors and Contributors

If you are the creator of a new style or have made significant changes to it, add yourself as an author in the `<author/>` element.
If you are not the original author or have made minor changes, add yourself as a contributor in the `<contributor/>` element.

Consider including a permanent identifier such as an ORCID ID in the `<uri/>` element:

```xml
   <author>
     <name>Jane Smith</name>
     <uri>https://orcid.org/0000-0002-9131-5520</uri>
   </author>
   <contributor>
     <name>John Doe</name>
     <uri>https://orcid.org/0009-0004-7791-2291</uri>
   </contributor>
```

## 13 - XML Indentation

Indent the style's XML with 2 spaces per level.
Some text editors support automatic indentation of XML.
Alternatively, use our [style formatter](http://formatter.citationstyles.org/) tool.

## 14 - Validation

Make sure your finished style [validates](https://github.com/citation-style-language/styles/blob/master/STYLE_DEVELOPMENT.md#validation) against the CSL schema.

That's it! You're ready to [submit](https://github.com/citation-style-language/styles/blob/master/CONTRIBUTING.md) your style!
