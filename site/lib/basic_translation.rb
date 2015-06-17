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

def layout_for_item(item)
  layout_name = item[:layout] || 'default'
  item_lang = language_code_of(item) || 'en'
  return File.join(item_lang, layout_name)
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
          str << "\n<li>\n"
        end
      end
    end
  end
  return str
end
