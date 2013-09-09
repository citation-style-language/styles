require 'csl'

STYLE_ROOT = File.expand_path('../..', __FILE__)

ISSN = Hash.new { |h,k| h[k] = [] }
TITLES = Hash.new { |h,k| h[k] = [] }

# These ISSNs are ignored when checking for duplicate ISSNs
ISSN_FILTER = %w{
  1662-453X 1663-9812 1664-042X 1664-0640 1664-1078 1664-2295
  1664-2392 1664-302X 1664-3224 1664-462X 1664-8021 2234-943X
  0036-8075 1095-9203 1359-4184 1476-5578 1097-6256 1047-7594
  1546-1726
}

# These titles are ignored when checking for duplicate titles
TITLES_FILTER = [
  # 'example title 1',
  # 'example title 2'
]

# These styles are ignored when checking for valid citation-formats
CITATION_FORMAT_FILTER = %w{
  bibtex blank national-archives-of-australia
}

# These files are ignored when checking for extra files
EXTRA_FILES_FILTER = [
  'CONTRIBUTING.md', 'Gemfile', 'Gemfile.lock', 'README.md',
  'dependent', 'Rakefile', 'spec', 'spec_helper.rb', /_spec\.rb$/,
  'renamed-styles.json'
]

EXTRA_FILES = Dir[File.join(STYLE_ROOT, '**', '*')].reject do |file|
  name = File.basename(file)
  File.extname(file) == '.csl' || EXTRA_FILES_FILTER.any? { |f| f === name }
end

# Default license and rights text
CSL::Schema.default_license = 'http://creativecommons.org/licenses/by-sa/3.0/'
CSL::Schema.default_rights_string =
  'This work is licensed under a Creative Commons Attribution-ShareAlike 3.0 License'


# RSpec Error Formatter For Minimal Output
require 'rspec/core/formatters/base_text_formatter'
class ErrorFormatter < RSpec::Core::Formatters::BaseTextFormatter

  def example_pending(example)
    super(example)
    output.print pending_color('*')
  end

  def example_failed(example)
    super(example)
    output.print failure_color('F')
  end

  def start_dump
    super()
    output.puts
  end
end

def load_style(path)
  filename = File.basename(path)
  id = filename[0..-5]

  begin
    style = CSL::Style.load(path)
  rescue
    # failed to parse the style. we'll report the error later
  end

  unless style.nil?
    begin
      if style.info.has_issn?
        [style.info.issn].flatten(1).each do |issn|
          ISSN[issn.to_s] << id unless ISSN_FILTER.include?(issn.to_s)
        end
      end

      if style.info.has_eissn?
        [style.info.eissn].flatten(1).each do |issn|
          ISSN[issn.to_s] << id unless ISSN_FILTER.include?(issn.to_s)
        end
      end

      if style.has_title?
        title = style.title.to_s.downcase
        TITLES[title] << id unless TITLES_FILTER.include?(title)
      end
    rescue
      warn "Failed to extract ISSN of style #{id}"
    end
  end

  [id, [filename, path, style]]
end


# Collect styles to include in this test run.
#
# By default, all *.csl files will be included. If the environment
# variable CSL_TEST is set, only the style files matching the content
# of the variable will be tested; this can be a space separated list
# of files including regular expressions; if CSL_TEST is set to the
# special value `git' only those styles which have been modified since
# the last commit will be tested.
#
# Note that this requires the `git` executable to be available. Also
# note that this will not catch new files which have not yet been
# committed, but only modified files.
#
# Examples:
#
# $ CSL_TEST=git bundle exec rspec spec --format doc
# -> only includes changed styles and using documentation format
#
# $ CSL_TEST="apa.csl vancouver.csl" bundle exec rspec spec
# -> only run test for apa.csl and vancouver.csl
#
# $ CSL_TEST="chicago.*" bundle exec rspec spec
# -> run tests for all styles starting with 'chicago'

STYLE_FILTER = case ENV['CSL_TEST']
  when nil
    /./
  when 'git'
    Regexp.new("/(#{`git diff --name-only`.split(/\s+/).join('|')})$")
  else
    Regexp.new("/(#{ENV['CSL_TEST'].split(/\s+/).join('|')})$")  
  end

def collect_styles(type = '')
  Dir[File.join(STYLE_ROOT, type, '*.csl')].select do |filename|
    filename =~ STYLE_FILTER
  end
end

print "\nLoading dependent styles"

Dependents = Hash[collect_styles('dependent').each_with_index.map { |path, i|
  print '.' if i % 120 == 0
  load_style(path)
}]

print "\nLoading independent styles"

Independents = Hash[collect_styles.each_with_index.map { |path, i|
  print '.'  if i % 120 == 0
  load_style(path)
}]

puts
