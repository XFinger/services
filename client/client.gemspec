# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'client/version'

Gem::Specification.new do |spec|
  spec.name          = "client"
  spec.version       = Client::VERSION
  spec.authors       = ["Dan Mayer"]
  spec.email         = ["dan@mayerdan.com"]
  spec.description   = ["description goes here"]
  spec.summary       = ["summary goes here"]
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rest-client'
  spec.add_dependency 'json'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
