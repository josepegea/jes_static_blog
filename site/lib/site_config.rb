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
    @deploy.keys.each do |k|
      env_val = ENV["NANOC_CONF_#{k}"]
      @deploy[k] = env_val if env_val.present?
    end
  end

  def self.deploy(key)
    site_config.deploy[key]
  end
end
