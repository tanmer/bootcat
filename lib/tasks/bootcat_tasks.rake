# desc "Explaining what the task does"
# task :bootcat do
#   # Task goes here
# end
require 'fileutils'

namespace :bootcat do
  desc "Install bootcat"
  task :install do
    settings_yml_default = File.expand_path('../../../config/settings.yml.example', __FILE__)
    settings_yml = Rails.root.join('config', 'settings.yml')
    unless File.exist?(settings_yml)
      puts "creating #{settings_yml}"
      FileUtils.cp settings_yml_default, settings_yml
    end
    Rake::Task['bootcat_engine:install:migrations'].invoke
  end
end
