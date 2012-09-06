require 'csl'

STYLE_ROOT = File.expand_path('../..', __FILE__)

ISSN = Hash.new { |h,k| h[k] = [] }

# These styles are ignored when checking for duplicate ISSNs
ISSN_FILTER = %w{
	science science-without-title molecular-psychiatry
	molecular-psychiatry-letters frontiers-in-aging-neuroscience
	frontiers-in-behavioral-neuroscience frontiers-in-evolutionary-neuroscience
	frontiers-in-human-neuroscience frontiers-in-integrative-neuroscience
	frontiers-in-molecular-neuroscience frontiers-in-neural-circuits
	frontiers-in-neuroanatomy frontiers-in-neuroenergetics
	frontiers-in-neuroengineering frontiers-in-neuroinformatics
	frontiers-in-neurorobotics frontiers-in-synaptic-neuroscience
	frontiers-in-systems-neuroscience	frontiers-in-cellular-neuroscience
	frontiers-in-computational-neuroscience
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
		unless ISSN_FILTER.include?(id)
	    if style.info.has_issn?
	      Array(style.info.issn).each do |issn|
	        ISSN[issn.to_s] << id
	      end
	    end
    
	    if style.info.has_eissn?
	      Array(style.info.eissn).each do |issn|
	        ISSN[issn.to_s] << id
	      end
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
