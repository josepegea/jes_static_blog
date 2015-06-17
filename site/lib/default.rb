# encoding: UTF-8

# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

require 'active_support'
require 'active_support/dependencies'

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Text

# Returns the last 'count' articles

def get_last_news(options = {})
  count = options[:count] || 5
  language = options[:language] || @item[:language]
  articles_hash = sorted_articles.group_by {|item| item[:canonical_identifier]}
  articles = []
  articles_hash.each do |ident, items|
    if !ident.blank?
      articles << translated_identifier(ident, language)
    else
      articles.concat(items)
    end
  end
  articles.sort! {|a, b| a.created_at <=> b.created_at}
  return articles[0, count]
end

# Creates a localized link

def l_link_to(label, identifier, language = nil, attributes = {})
  curr_lang = language_code_of(@item)
  lang = language || curr_lang
  dest_item = translated_identifier(identifier, lang)
  if dest_item[:language] != lang
    label += " (#{language_name_for_code(dest_item[:language])})"
  end
  return link_to(label, dest_item, attributes)
end


