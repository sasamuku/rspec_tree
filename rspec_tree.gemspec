# frozen_string_literal: true

require_relative "lib/rspec_tree/version"

Gem::Specification.new do |spec|
  spec.name = "rspec_tree"
  spec.version = RspecTree::VERSION
  spec.authors = ["sasamuku"]
  spec.email = ["sasazawa3330@gmail.com"]

  spec.summary = "tree command for rspec test files."
  spec.description = "tree command for rspec test files."
  spec.homepage = "https://github.com/sasamuku/rspec_tree"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.3.1"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/sasamuku/rspec_tree"
  spec.metadata["changelog_uri"] = "https://github.com/sasamuku/rspec_tree"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_dependency "thor"
end
