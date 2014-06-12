Gem::Specification.new do |s|
  s.name       = "timeleap"
  s.version    = "0.0.1"
  s.author     = "Pierre Sugar"
  s.email      = "pierre@sugaryourcoffee.de"
  s.homepage   = "https://github.com/sugaryourcoffee/timeleap"
  s.summary    = "Dynamically create date methods to jump through time"
  s.license    = "MIT"

  s.files      = Dir["{lib,spec}/**/*"] + %w(LICENSE README.md)
  s.test_files = Dir["spec/**/*"]
  s.has_rdoc   = true

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 2.13.1'
end
