require 'csl'

STYLE_ROOT = File.expand_path('../..', __FILE__)

ISSN = Hash.new { |h,k| h[k] = [] }

# These styles are ignored when checking for duplicate ISSNs
ISSN_FILTER = %w{ 1662-453X 1663-9812 1664-042X 1664-0640 1664-1078 1664-2295
1664-2392 1664-302X 1664-3224 1664-462X 1664-8021 2234-943X 0036-8075 1095-9203
1359-4184 1476-5578
}

def load_style(path)
  filename = File.basename(path)
  id = filename[0..-5]

  begin
    style = CSL::Style.load(path)
  rescue
    # failed to parse the style. we'll report the error later
  end

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
  rescue
    warn "Failed to extract ISSN of style #{id}"
  end

  [id, [filename, path, style]]
end


print "\nLoading dependent styles"

Dependents = Hash[Dir[File.join(STYLE_ROOT, 'dependent', '*.csl')].each_with_index.map { |path, i|
  print '.' if i % 100 == 0
  load_style(path)
}]

print "\nLoading independent styles"

Independents = Hash[Dir[File.join(STYLE_ROOT, '*.csl')].each_with_index.map { |path, i|
  print '.'  if i % 100 == 0
  load_style(path)
}]

puts
