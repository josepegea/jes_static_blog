require 'yaml'

class SiteConfig
  
  @@site_config = nil
  
  def self.site_config
    @@site_config = self.new if @@site_config.nil?
    return @@site_config
  end

  attr_accessor :deploy;
    
  def initialize
    @deploy = YAML.load_file(File.dirname(__FILE__) + '/../config/deploy.yml')
  end
    
  def self.deploy(key)
    site_config.deploy[key]
  end
  
end