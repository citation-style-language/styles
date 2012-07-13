require 'csl'

STYLE_ROOT = File.expand_path('../..', __FILE__)

INDEPENDENT_STYLES = Dir[File.join(STYLE_ROOT, '*.csl')]
DEPENDENT_STYLES = Dir[File.join(STYLE_ROOT, 'dependent', '*.csl')]
