if Settings['paperclip'] && Settings.paperclip['enable']
  Rails.application.config.paperclip_defaults = Settings.paperclip['options'] || {}
end
