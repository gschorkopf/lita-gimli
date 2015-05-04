Gem::Specification.new do |spec|
  spec.name          = "lita-gimli"
  spec.version       = "0.0.1"
  spec.authors       = ["Geoffrey Schorkopf"]
  spec.email         = ["gschorkopf@gmail.com"]
  spec.description   = %q{Lita handler that contributes an axe}
  spec.summary       = %q{Lita handler that contributes an axe}
  spec.homepage      = "TODO: Add a homepage"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 3.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
