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

def layout_for_item(item)
  layout_name = item[:layout] || 'default'
  item_lang = language_code_of(item) || 'en'
  return File.join(item_lang, layout_name)
end
