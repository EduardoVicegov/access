# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# vendor/assets
Rails.application.config.assets.precompile += %w( fontawesome-free/css/all.css
                                                  jquery/jquery.js 
                                                  bootstrap/js/bootstrap.bundle.js 
                                                  jquery-easing/jquery.easing.js )

# lib/assets
Rails.application.config.assets.precompile += %w( sb-admin-2.js sb-admin-2.css img.jpeg )
