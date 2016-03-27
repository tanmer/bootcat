if Settings['paperclip'] && Settings.paperclip['enable']
  Paperclip::Attachment.default_options.update((Settings.paperclip['options'] || {}).deep_symbolize_keys)
end
