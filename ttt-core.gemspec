lib = File.expand_path("../lib", __FILE__)
$:.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ttt-core/version'

Gem::Specification.new do |spec|
  spec.name          = "ttt-core"
  spec.version       = TTTCore::VERSION
  spec.authors       = ["Georgina McFadyen"]
  spec.email         = ["gemcfadyen@hotmail.com"]
  spec.description   = "Tic Tac Toe Rules to be used in conjunction with a front end"
  spec.summary       = "Tic Tac Toe Rules"
  spec.homepage      = "https://github.com/gemcfadyen/Apprenticeship-RubyTicTacToe"
  spec.license       = 'MIT'
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '10.5'
  spec.add_development_dependency 'rspec', '~> 3.4'
end
