# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-swfobject/version"

Gem::Specification.new do |spec|
  spec.name          = "jekyll-swfobject"
  spec.version       = Jekyll::SWFObject::VERSION
  spec.authors       = ["Jens Krause"]
  spec.email         = ["info@websector.de"]
  spec.description   = %q{Liquid plugin for using SWFObject with Jekyll}
  spec.summary       = %q{SWFObject Tag is a Liquid plugin for Jekyll to embed Flash files (*.swf) using SWFObject}
  spec.homepage      = "https://github.com/sectore/jekyll-swfobject"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.0.0'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("jekyll", ">= 2.0.0")
  spec.add_development_dependency("bundler", ">= 1.3")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("shoulda", ">= 3.5.0")
  spec.add_development_dependency("shoulda-context", ">= 1.1.6")
  spec.add_development_dependency("mocha", ">= 1.1.0")
end