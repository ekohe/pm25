# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pm25/version'

Gem::Specification.new do |spec|
  spec.name          = "pm25"
  spec.version       = Pm25::VERSION
  spec.authors       = ["Xuhao"]
  spec.email         = ["xuhao@rubyfans.com"]
  spec.description   = %q{PM2.5 reporting from U.S. Consulate}
  spec.summary       = %q{PM2.5 reporting from U.S. Consulate}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_dependency 'activesupport'
  spec.add_dependency 'httparty'
end
