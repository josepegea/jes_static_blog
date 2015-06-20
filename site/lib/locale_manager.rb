require 'yaml'

class LocaleManager
  
  @@locale_manager = nil
  
  def self.locale_manager
    @@locale_manager = self.new if @@locale_manager.nil?
    return @@locale_manager
  end

  attr_accessor :locales;
    
  def initialize
    @locales = {}
    @locales[:en] = YAML.load_file(File.dirname(__FILE__) + '/../locales/en.yml')
    @locales[:es] = YAML.load_file(File.dirname(__FILE__) + '/../locales/es.yml')
  end
    
  def self.translate(key_path, lang)
    hash = locale_manager.locales[lang.to_sym]
    begin
      return value_for_key_path(hash, key_path)
    rescue
      raise "key_path '#{key_path}' missing for language '#{lang}'"
    end
  end
  
  private
  
  def self.value_for_key_path(hash, key_path)
    keys = key_path.split(".")
    val = hash
    keys.each do |k|
      val = val[k]
    end
    return val
  end
  
end