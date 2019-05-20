#!/usr/bin/env ruby

require 'dotenv/load'
require 'citeproc'
require 'csl'
require 'csl/styles'
require 'JSON'
require 'reverse_markdown'
require 'net/http'
require 'octokit'
require 'base64'
require 'open-uri'
require 'diffy'

exit(true) if (ENV['TRAVIS_PULL_REQUEST'] || 'false') == 'false'

REPO = ENV['TRAVIS_REPO_SLUG']
PR = Integer(ENV['TRAVIS_PULL_REQUEST'])
GH = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])

WELCOME = """
Awesome! You just created a pull request to the Citation Styles Language styles repository. One of our human volunteers will try to get in touch soon (usually within a week). In the meantime, I will run some automated checks. You should be notified of the results in a few minutes.

If you haven't done so yet, please make sure your style [validates](https://github.com/citation-style-language/styles/wiki/Validation) and follows all our other [Style Requirements](https://github.com/citation-style-language/styles/wiki/Style-Requirements).

To update this pull request, visit the "Files changed" tab above, and click on the pencil icon (see below) in the top-right corner of your style to start editing.

<img width="274" src="https://user-images.githubusercontent.com/77951/34369455-bd50432c-eab3-11e7-945e-6a6147dfc507.png">

If you have any questions, please leave a comment and we'll get back to you. While we usually respond in English, feel free to write in whatever language you're most comfortable.
""".trim()

GH.issue_comments(REPO, PR).each{|comment|
  print comment.body
}
exit(true)

if File.file?('spec/travis.txt')
  travis = File.read('spec/travis.txt')
  travis.gsub!(/\e\[([;\d]+)?m/, '')
  if travis.include?("\nFailures:\n")
    travis.sub!(/.*\nFailures:\n/m, '')
    travis = "<details><summary>Tests failed</summary>\n\n<pre>#{travis}</pre>\n\n</details>"
    GH.add_comment(REPO, PR, travis)
    exit(true)
  end
end

Style = Struct.new(:path, :baseline)

styles = []
`git diff --name-status $TRAVIS_COMMIT_RANGE`.split(/\n/).each{|change|
  case change[0]
    when 'M'
      action, style = change.split(/\t/)
      next if !style.end_with?('.csl')
      styles << Style.new(style, `git show master:#{style}`)

    when 'D'
      next

    when 'A'
      action, style = change.split(/\t/)
      next if !style.end_with?('.csl')
      styles << Style.new(style)

    when 'R'
      action, from, to = change.split(/\t/)
      next if !to.end_with?('.csl')
      styles << Style.new(to, `git show master:#{from}`)

    else
      throw "Unexpected change of type #{change[0]}"

  end
}
exit(true) if styles.empty?

styles.sort!{|a, b|
  da = File.dirname(a.path)
  db = File.dirname(b.path)
  if da.length == db.length
    # they're both dependents, or both independents, sort on name
    a.path <=> b.path
  else
    # if one is dependent and the other is not, prioritize independents at the root level
    da.length <=> db.length
  end
}

def render(items, style)
  result = ''
  cp = CiteProc::Processor.new(style: style, format: 'html')
  cp.import(items)

  items.each_slice(2){|citation|
    result += cp.process(citation.map{|i| { 'id' => i['id'] } }) + "<br/>\n"
  }

  result += "<hr/>\n"
  
  cp.bibliography.each{|line| result += line + "<br/>\n" }

  return result
end

items = JSON.load(File.open(File.join(File.dirname(__FILE__), 'items.json')))

comments = ''
max = 10
if styles.length > max
  comments = "#{styles.length} styles changed, showing #{max}\n\n"
  styles = styles.take(max)
end

styles.each{|style|
  comments += '<details>'

  rendered = render(items, style.path)
  baseline = style.baseline ? render(items, style.baseline) : nil
  
  if baseline && rendered == baseline
    status = 'modified style; unchanged output for sample items'
  elsif baseline
    status = 'modified style'
  else
    status = 'new'
  end

  comments += "<summary>#{style.path} (#{status})</summary>\n"
  comments += "<blockquote>#{rendered}</blockquote>\n"

  if baseline && baseline != rendered
    comments += "\n```diff\n"
    comments += Diffy::Diff.new(baseline, rendered).to_s
    comments += "\n```\n"
  end

  comments += '</details>'
}

GH.add_comment(REPO, PR, comments)
