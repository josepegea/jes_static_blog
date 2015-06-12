# encoding: UTF-8

# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Text

# Returns the last 'count' articles

def get_last_news(count = 5)
  return sorted_articles[0,count]
end

# Creates a localized link

def l_link_to(label, identifier, language = nil, attributes = {})
  curr_lang = language_code_of(@item)
  dest_item = translated_identifier(identifier, curr_lang)
  return link_to(label, dest_item, attributes)
end


