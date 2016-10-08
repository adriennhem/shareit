source 'https://rubygems.org'

ruby "2.3.1"


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
gem 'rails-i18n', '~> 4.0.0' # for Rails 4
gem 'bootstrap-sass', '~> 3.3.4'
gem 'sass-rails', '>= 3.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5.0.0'
gem 'simple_form'
gem 'mail_form'
gem 'bootstrap-wysihtml5-rails'
gem 'jquery-turbolinks'
gem 'acts-as-taggable-on', '~> 3.4'
gem 'will_paginate'
# Email sender
gem 'mandrill-api'

# ActiveAdmin
gem "font-awesome-rails"
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'activeadmin_expandable_inputs'


# Payment Related
gem 'stripe'
gem 'receipts'
gem 'wicked_pdf'

# Video background
gem 'vider', github: 'wazery/vider'

# Slack Notifier
gem 'slack-notifier'

# Realtime 
gem 'pusher'



# WYSIWYG
gem 'ckeditor', github: 'galetahub/ckeditor'

# authorization updated 
gem "pundit"

# local variables
gem "figaro"

gem 'friendly_id', '~> 5.1.0' # Note: You MUST use 5.0.0 or greater for Rails 4.0+

# For image uploading
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"
gem 'aws-sdk', '< 2.0'

# For authentification
gem 'devise'


gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# CRON Jobs
gem 'whenever', :require => false

# SEO
gem 'sitemap_generator'
gem 'meta-tags'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'puma', '~> 3.5', '>= 3.5.2'

gem 'sqlite3', group: :development

group :production do 
	gem 'rails_12factor'
	gem 'pg'
  gem 'wkhtmltopdf-heroku'
end


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'wkhtmltopdf-binary-edge', '~> 0.12.2.1'

  # Rspec test 
  gem 'rspec-rails', '~>3.0'
  

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

