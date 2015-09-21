$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'conduit/reactor/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|

  # Details
  #
  s.name     = 'conduit-reactor'
  s.version  = Conduit::Reactor::VERSION
  s.authors  = ['Doug Perez']
  s.email    = ['doug.perez@hellolabs.com']
  s.homepage = 'https://github.com/conduit/conduit-reactor'
  s.summary  = 'BeQuick Reactor Driver for Conduit'

  # Files
  #
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib']

  # Dependencies
  #
  s.add_dependency 'conduit',    '~> 0.6.0'
  s.add_dependency 'multi_json', '~> 1.10.1'
  s.add_dependency 'pry-rails',  '~> 0.3.2'

  # Development Dependencies
  #
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-its'
  s.add_development_dependency 'rake'
end
