#bugfix: I18n::InvalidLocale: :"zh-CN" is not a valid locale
I18n.config.enforce_available_locales = false

Rails.application.config.i18n.available_locales = ["zh-CN"]
Rails.application.config.i18n.default_locale = "zh-CN".to_sym
Rails.application.config.before_configuration do
  I18n.locale = "zh-CN".to_sym
  I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '**', '*.{rb,yml}')]
  I18n.reload!
end
