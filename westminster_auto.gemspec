require_relative 'lib/westminster_auto/version'

Gem::Specification.new do |spec|
  spec.name          = "westminster_auto"
  spec.version       = WestminsterAuto::VERSION
  spec.authors       = ["jrog20"]
  spec.email         = ["jaimerogstad@gmail.com"]

  spec.summary       = "Available vehicles at Westminster Auto"
  spec.description   = "Provides details on available vehicles at Westminster Auto in Westminster, VT"
  spec.homepage      = "https://github.com/jrog20/westminster_auto"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jrog20/westminster_auto"
  spec.metadata["changelog_uri"] = "https://github.com/jrog20/westminster_auto"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
