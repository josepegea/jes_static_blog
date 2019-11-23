# encoding: UTF-8

# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

require 'active_support'
require 'active_support/dependencies'

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Text
include Nanoc::Helpers::XMLSitemap

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
  articles.sort! {|a, b| b.attributes[:created_at] <=> a.attributes[:created_at]}
  return articles[0, count]
end

# Creates a localized link

def l_url_for(identifier, language = nil)
  curr_lang = language_code_of(@item)
  lang = language || curr_lang
  dest_item = translated_identifier(identifier, lang)
  return dest_item.path
end

def l_link_to(label, identifier, language = nil, attributes = {})
  curr_lang = language_code_of(@item)
  lang = language || curr_lang
  dest_item = translated_identifier(identifier, lang)
  if dest_item[:language] != lang
    label += " (#{language_name_for_code(dest_item[:language])})"
  end
  if  dest_item[:canonical_identifier] != @item[:canonical_identifier] || 
      curr_lang != dest_item[:language]
    return link_to(label, dest_item, attributes)
  else
    return label
  end
end

def html_options(options)
  res = options.reduce('') do |memo, (key, value)|
    memo + key.to_s + '="' + h(value) + '" '
  end
  return res
end

def enclose_block(text, container_type = 'div', options = {})
  res = ""
  res << "<#{container_type} #{html_options(options)} >\n"
  res << text
  res << "\n"
  res << "</#{container_type}>\n"
  return res
end
  
# Encloses text in HTML containers for Markdown docs

def md_include_html(html)
  res = "{::options parse_block_html=\"true\" /}\n"
  res << html
  res << "\n{::options parse_block_html=\"false\" /}\n"
  return res
end

def md_begin_block(container_type = 'div', options = {})
  return md_include_html("<#{container_type} #{html_options(options)} >\n")
end

def md_end_block(container_type = 'div')
  return md_include_html("</#{container_type}>\n")
end

def md_enclose_block(text, container_type = 'div', options = {})
  res = ""
  res << md_begin_block(container_type, options)
  res << text
  res << "\n"
  res << md_end_block(container_type)
  return res
end

