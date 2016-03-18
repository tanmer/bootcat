$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bootcat/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "bootcat"
  s.version     = Bootcat::VERSION
  s.authors     = ["xiaohui"]
  s.email       = ["xiaohui@zhangxh.net"]
  s.homepage    = "http://tanmer.com"
  s.summary     = "Summary of Bootcat."
  s.description = "Description of Bootcat."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2", ">= 4.2.5.1"
  s.add_dependency "settingslogic", "~> 2.0", ">= 2.0.9"

  s.add_development_dependency "sqlite3"
end
