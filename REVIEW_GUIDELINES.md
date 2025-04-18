# New Submissions

## Info section/style metadata
- Style has documentation link (click on the link to make sure it's actually the new documentation rather than the link left in from the template)
  - Where no public documentation is available, we offer people to upload it to github (though be mindful of copyright) and then link to the github post. We rarely make exceptions to this requirement
- Style has template link _or_ submitter credibly states that they started from scratch (you can tell by macro names & structure, typically)

### Journal styles 
  - Have all ISSNs used for the journal (check https://portal.issn.org/ )
  - Have the correct version of the journal title; there's sometimes room for interpretation, but we generally default to the full, not abbreviated title
 
### Default locale
The absence or presence of default-locale should make sense (the vast majority of styles should have a default locale since they're only used in one language). Non-English styles should also reflect that in parentheses in the style title -- we now have a test for that.

## Style quality
We can't do line-by-line reviews of all style submissions. Here is what I'd suggest
- Skim the style for obvious deviations from best practices such as hard-coded terms and use of variables for unintended use cases as workarounds (the official repository is not the place for workarounds)
- Quickly compare the automatically generated sample citations with the style guide and note discrepancies
  - note that citeproc-ruby, which we use, has some minor quirks, especially with the application of delimiters within `choose` elements.
  - Note obvious problems and ask about other things (e.g. I typically insist on having `substitute` work in a reasonable way)

# Style updates/fixes

These tend to have fewer issues, but still good to check.
- Ideally, submitters include a link to documentation for the change/error. @POBrien333 e.g. will always include a link to the Zotero forums thread in question. Check if the proposed change fixes this. 
  - Try to be mindful of unintended consequences: e.g., if changing a block of code to fix one item type, make sure it doesn't also apply to other item types.
- Be careful when changing major styles, in particular APA, Chicago Manual, Cite Them Right, MLA, and Vancouver -- these tend to be carefully written, so any changes should be double-checked carefully (for APA ask bwiernik, for Chicago adam3smith or adunning, the others anyone can look at).
- Make sure the documentation link in the style is up to date

# General policies

- Try to remind people of their pull request after ca. 14 days of inactivity and close it after ca. 30 days without reaction, always saying that we're happy to re-open.
- When in doubt about policy, just confer with the rest of active maintainers
