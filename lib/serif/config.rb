require "yaml"

module Serif
class Config
  def initialize(config_file)
    @config_file = config_file
  end

  def admin_username
    yaml["admin"]["username"]
  end

  def admin_password
    yaml["admin"]["password"]
  end

  def image_upload_path
    yaml["image_upload_path"] || "/images/:timestamp_:name"
  end

  def permalink
    yaml["permalink"] || "/:title"
  end

  def archive_enabled?
    a = yaml["archive"]

    if a
      a["enabled"]
    else
      false
    end
  end

  def archive_url_format
    (yaml["archive"] || {})["url_format"] || "/archive/:year/:month"
  end

  private

  def yaml
    @yaml ||= YAML.load_file(@config_file)
  end
end
end
