module Bootcat
  class Engine < ::Rails::Engine
    # isolate_namespace Bootcat
    rake_tasks { load "tasks/bootcat_tasks.rake" }
    require 'ckeditor'
  end
end
