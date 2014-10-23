# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_form_fileinput/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_form_fileinput"
  spec.version       = SimpleFormFileinput::VERSION
  spec.authors       = ["smit1625"]
  spec.email         = ["smit1625@msu.edu"]
  spec.description   = %q{Beautifies the default file input for SimpleForm}
  spec.summary       = %q{Uses bootstrap-fileinput to enhance SimpleForm's default datetime input}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "railties"
  spec.add_dependency "simple_form"
end
