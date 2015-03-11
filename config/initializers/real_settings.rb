# Caution: settings in 'file_config' can't store in database.

Settings.file_config do |settings|
  # settings.app_name = "My Application Name"
  # settings.app_url = "http://www.my-application.com"
end

Settings.db_config_default do |settings|
  # settings.paginate_count = 10
end