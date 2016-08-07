# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/json/version'

Gem::Specification.new do |spec|
  spec.name          = "ruboty-json"
  spec.version       = Ruboty::Json::VERSION
  spec.authors       = ["nownabe"]
  spec.email         = ["nownabe@gmail.com"]

  spec.summary       = %q{Ruboty's brain as a JSON file}
  spec.homepage      = "https://github.com/nownabe/ruboty-json"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ruboty"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
