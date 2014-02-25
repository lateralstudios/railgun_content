$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "railgun_content/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "railgun_content"
  s.version     = RailgunContent::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailgunContent."
  s.description = "TODO: Description of RailgunContent."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.17"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "mysql2"
end
