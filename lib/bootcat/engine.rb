module Bootcat
  class Engine < ::Rails::Engine
    # isolate_namespace Bootcat
    rake_tasks { load "tasks/bootcat_tasks.rake" }
    require 'ckeditor'
    require 'paperclip'
    require 'paperclip-qiniu'
    require 'draper'
  end
end
