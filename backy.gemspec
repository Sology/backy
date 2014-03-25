# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backy/version'

Gem::Specification.new do |spec|
  spec.name          = "backy"
  spec.version       = Test::VERSION
  spec.authors       = ["Konrad Strojny"]
  spec.email         = ["kocasp@gmail.com"]
  spec.summary       = %q{Simple and quick database backup.}
  spec.description   = %q{Backup your databse (PostgreSQL or MySQL) with rake task. Handles capistrano.}
  spec.homepage      = "http://www.sology.eu"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
