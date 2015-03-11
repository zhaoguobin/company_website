# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( iehacks.css html5shiv.js )
Rails.application.config.assets.precompile += %w( custom.css normal.css )
Rails.application.config.assets.precompile += %w( admin/admin.css admin/admin.js )
