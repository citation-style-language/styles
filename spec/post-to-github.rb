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

gh = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])

if File.file?('spec/travis.txt')
  travis = File.read('spec/travis.txt')
  travis.gsub!(/\e\[([;\d]+)?m/, '')
  if travis.include?("\nFailures:\n")
    travis.sub!(/.*\nFailures:\n/m, '')
    travis = "<details><summary>Tests failed</summary>\n\n<pre>#{travis}</pre>\n\n</details>"
    gh.add_comment(ENV['TRAVIS_REPO_SLUG'], Integer(ENV['TRAVIS_PULL_REQUEST']), travis)
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

gh.add_comment(ENV['TRAVIS_REPO_SLUG'], Integer(ENV['TRAVIS_PULL_REQUEST']), comments)
