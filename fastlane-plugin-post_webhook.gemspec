lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/post_webhook/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-post_webhook'
  spec.version       = Fastlane::PostWebhook::VERSION
  spec.author        = 'Lorenzo Zabot'
  spec.email         = 'lorenzo.zabot@voxtours.com'

  spec.summary       = 'Triggers a generic webhook.'
  # spec.homepage      = "https://github.com/<GITHUB_USERNAME>/fastlane-plugin-post_webhook"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.required_ruby_version = '>= 2.6'

  # Don't add a dependency to fastlane or fastlane_re
  # since this would cause a circular dependency

  # spec.add_dependency 'your-dependency', '~> 1.0.0'
end
