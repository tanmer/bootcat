Bootcat::Engine.routes.draw do

end

Rails.application.routes.draw do
  mount Ckeditor::Engine => Settings.ckeditor['path_prefix'] || '/ckeditor'
end if Settings['ckeditor'] && Settings.ckeditor['enable']
