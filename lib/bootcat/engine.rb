module Bootcat
  class Engine < ::Rails::Engine
    # isolate_namespace Bootcat
    rake_tasks { load "tasks/bootcat_tasks.rake" }
    require 'rails-i18n'
    require 'i18n_yaml_generator'
    require 'ckeditor'
    require 'paperclip'
    require 'paperclip-qiniu'
    require 'draper'
    require 'redis'
    require 'kaminari'
    require 'kaminari-i18n'
  end
end
