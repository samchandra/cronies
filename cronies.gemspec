# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cronies/version'

Gem::Specification.new do |spec|
  spec.name          = "cronies"
  spec.version       = Cronies::VERSION
  spec.authors       = ["Samuel Chandra"]
  spec.email         = ["001@samuelc.com"]
  spec.description   = %q{Simple gem to prevent cron-ing your ruby script multiple times by using simple file based locking.}
  spec.summary       = %q{Helper for cron-ing ruby script}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
