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
  s.add_dependency 'rqrcode_png', '~> 0.1.5'
  s.add_dependency 'addressable', '~> 2.4'

  s.add_dependency 'redis', '~> 3.2.1'
  s.add_dependency 'redis-namespace', '~> 1.5.2'

  s.add_dependency 'ckeditor', '~> 4.1.0'
  s.add_dependency "paperclip-qiniu", "0.2.0"
  s.add_dependency 'draper', '~> 2.1.0'

  s.add_dependency 'rails-i18n', '~> 4.0.8'
  s.add_dependency 'i18n_yaml_generator', '0.0.1'

  s.add_dependency 'browser', '~> 1.0.1'
  s.add_dependency 'kaminari', '~> 0.16.3'
  s.add_dependency 'kaminari-i18n', '~> 0.4.0'

  s.add_development_dependency "sqlite3"
end
