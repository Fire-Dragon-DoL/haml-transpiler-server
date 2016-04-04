# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "haml-transpiler-server/version"

Gem::Specification.new do |spec|
  spec.name          = "haml-transpiler-server"
  spec.version       = HamlTranspilerServer::VERSION
  spec.authors       = ["Fire-Dragon-DoL"]
  spec.email         = ["francesco.belladonna@gmail.com"]

  spec.summary       = %q{Simple HTTP server which allows transpiling HAML files using Ruby implementation}
  spec.description   = %q{Simple HTTP server which allows transpiling HAML files through HTTP request using Ruby implementation}
  spec.homepage      = "https://github.com/Fire-Dragon-DoL/haml-transpiler-server"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",   "~> 1.11"
  spec.add_development_dependency "rake",      "~> 10.0"
  spec.add_development_dependency "rspec",     "~> 3.0"
  spec.add_development_dependency "rack-test", "~> 0.6"
  spec.add_dependency "sinatra", "~> 1.4"
  spec.add_dependency "puma",    "~> 3.2"
  spec.add_dependency "haml"
  spec.add_dependency "tilt"
end
