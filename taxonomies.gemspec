# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'taxonomies/version'

Gem::Specification.new do |spec|
  spec.name        = 'taxonomies'
  spec.version     = Taxonomies::VERSION
  spec.date        = '2015-01-20'
  spec.summary     = 'Model taxonomies structure and metadata.'
  spec.description = 'Model taxonomies structure and metadata. Intended for use with Spree and Solidus.'
  spec.authors     = ['Cooper LeBrun']
  spec.email       = ['cooperlebrun@gmail.com']
  spec.homepage    = 'http://github.com/hxegon/taxonomies'
  spec.license     = 'MIT'

  spec.add_dependency 'rubytree', '>= 0.9.7'
  
  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
