# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ghost/seeder/version'

Gem::Specification.new do |spec|
  spec.name          = "ghost-seeder"
  spec.version       = Ghost::Seeder::VERSION
  spec.authors       = ["Mario Andrés Correa"]
  spec.email         = ["a@macool.me"]

  spec.summary       = %q{Seeding ghost's DB}
  spec.homepage      = "https://github.com/noggalito/ghost-seeder"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rake", "~> 11.3"
  spec.add_dependency "faker", "~> 1.6"
  spec.add_dependency "colorize", "~> 0.8"
  spec.add_dependency "activerecord", "~> 4.2"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rspec", "~> 3.0"
end
