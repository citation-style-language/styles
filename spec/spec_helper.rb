require 'csl'

STYLE_ROOT = File.expand_path('../..', __FILE__)

IndependentStyles = Dir[File.join(STYLE_ROOT, '*.csl')].freeze
DependentStyles = Dir[File.join(STYLE_ROOT, 'dependent', '*.csl')].freeze
