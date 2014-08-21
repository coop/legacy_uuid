# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'legacy_uuid/version'

Gem::Specification.new do |spec|
  spec.name          = "legacy_uuid"
  spec.version       = LegacyUUID::VERSION
  spec.authors       = ["EDH Payments Team"]
  spec.email         = ["payments@everydayhero.com.au"]
  spec.summary       = "Convert uids to predictable uuids"
  spec.description   = spec.summary
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = "script"
  spec.executables   = spec.files.grep(%r{^script/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
