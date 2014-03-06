$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "railgun_content/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "railgun_content"
  s.version     = RailgunContent::VERSION
  s.authors     = ["Tom Beynon"]
  s.email       = ["tom@lateralstudios.com"]
  s.homepage    = "http://lateralstudios.com"
  s.summary     = "Content management for Railgun."
  s.description = "Content management module for Railgun."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"

  s.add_dependency "railgun"

  s.add_dependency "carrierwave"
  s.add_dependency "mini_magick"

  s.add_dependency "ancestry"
  s.add_dependency "friendly_id", "~> 4.0.10"
  s.add_dependency "acts_as_list"

  s.add_dependency "jquery-ui-rails"
  s.add_dependency "redactor-rails"
  s.add_dependency "chosen-rails"
  s.add_dependency "remotipart", '~> 1.2'

end
