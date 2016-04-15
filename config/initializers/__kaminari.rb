module KaminariMonkeyPatch
  extend ActiveSupport::Concern
  included do
    alias_method_chain :page_url_for, :patch
  end
  def page_url_for_with_patch(page)
    # require 'pry'
    # binding.pry
    if @options[:engine]
      @options[:engine].url_for @params.merge(@param_name => (page <= 1 ? nil : page), :only_path=>true).symbolize_keys
    else
      page_url_for_without_patch(page)
    end
  end
end

Kaminari::Helpers::Tag.send :include, KaminariMonkeyPatch