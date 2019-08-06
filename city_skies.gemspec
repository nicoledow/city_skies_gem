lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "city_skies/version"

Gem::Specification.new do |spec|
  spec.name          = "city_skies"
  spec.version       = CitySkies::VERSION
  spec.authors       = ["'Nicole Dow'"]
  spec.email         = ["'nikki.dow71@gmail.com'"]

  spec.summary       = %q{CitySkies tells you what is happening in your city's sky tonight.}
  spec.description   = %q{Type in your zip code to see visible planets, sunrise/sunset times, moonrise/moonset times, and special celestial events coming up.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

#need open-uri dependency???
  spec.add_dependency "nokogiri"
end
