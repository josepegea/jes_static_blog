# Basic helpers for managing translations
# Adapted from http://nanoc.ws/docs/guides/creating-multilingual-sites/

def language_code_of(item)
  # "/en/foo/" becomes "en"
  (item.identifier.match(/^\/([a-z]{2})\//) || [])[1]
end

def translations_of(item)
  @items.select do |i|
    i[:canonical_identifier] == item[:canonical_identifier]
  end
end

def translations_of_identifier(identifier)
  @items.select do |i|
    i[:canonical_identifier] == identifier
  end
end

def translated_identifier(identifier, lang)
  translations = translations_of_identifier(identifier)
  if translations.nil? || translations.empty?
    raise "'#{identifier}' has no translations!"
  end
  dest_item = translations.find {|i| language_code_of(i) == lang}
  dest_item = translations.first if dest_item.nil?
  return dest_item
end
  
LANGUAGE_CODE_TO_NAME_MAPPING = {
  'en' => 'English',
  'es' => 'Español'
}

def language_name_for_code(code)
  LANGUAGE_CODE_TO_NAME_MAPPING[code]
end

def language_name_of(item)
  language_name_for_code(
    language_code_of(item))
end

LANGUAGE_CODE_TO_PAGE_LABEL_MAPPING = {
  'en' => 'Read this page in English',
  'es' => 'Leer esta página en Español'
}

def this_page_in(language)
  return LANGUAGE_CODE_TO_PAGE_LABEL_MAPPING[language]
end

def localized_layout(ident, lang)
  # First, we look for the localized layout
  name = File.join('/', lang, ident, '/')
  if @site.layouts.find {|l| l.identifier == name}
    return name
  else
    # No point in checking if the non-localized exists.
    # If it doesn't, compilation will let us know
    return ident
  end
end

def layout_for_item(item)
  layout_name = item[:layout] || 'default'
  item_lang = language_code_of(item) || 'en'
  return localized_layout(layout_name, item_lang)
end

def links_to_translated_pages(item, options = {}, link_options = {})
  str = ""
  force_home = options[:force_home] || false
  if force_home || item[:canonical_identifier] != '/'
    if (versions = translations_of(item)).size > 1
      versions.each do |v|
    	  if v[:language] != item[:language]
          str << "<li>\n"
    			str << l_link_to(this_page_in(v[:language]),
    										item[:canonical_identifier], 
    										v[:language],
                        link_options)
          str << "\n</li>\n"
        end
      end
    end
  end
  return str
end

def links_to_alternate_homes
  if @item[:language] == 'es'
    str = l_link_to("English Site", "/", "en")
  else
    str = l_link_to("Web en Español", "/", "es")
  end
  return enclose_block(str, 'li')
end

def meta_for_translated_pages(item, options = {})
  strs = []
  ignore_current = options[:ignore_current]
  if (versions = translations_of(item)).size > 1
    versions.each do |v|
      lang = v[:language]
  	  if !ignore_current || lang != item[:language]
        url = l_url_for(item[:canonical_identifier], lang)
        strs << "<link rel=\"alternate\" href=\"#{url}\" hreflang=\"#{lang}\" type=\"text/html\">"
      end
    end
  end
  return strs.join("\n")
end

def print_date(date)
  if !(date.is_a?(Date) || date.is_a?(Time))
    date = attribute_to_time(date)
  end
  return date if !(date.is_a?(Date) || date.is_a?(Time))
  case @item[:language]
  when 'es'
    return date.strftime('%d/%m/%Y')
  else
    return date.strftime("%b #{ordinalize(date.day)}, %Y")
  end
end

def ord_for(number)
  if (number % 10) == 1 && (number % 100) != 11
    return 'st'
  elsif (number % 10) == 2 && (number % 100) != 12
    return 'nd'
  else
    return 'th'
  end
end

def f_ord_for(number)
  return "<small>#{ord_for(number)}</small>"
end

def ordinalize(number)
  return "#{number}#{f_ord_for(number)}"
end

def translate(key_path, lang = @item[:language])
  return LocaleManager.translate(key_path, lang)
end

alias t translate

