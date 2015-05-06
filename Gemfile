source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
gem 'bootstrap-sass', '~> 3.3.4'
gem 'sass-rails', '>= 3.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'simple_form'

# ActiveAdmin
gem "font-awesome-rails"
gem 'activeadmin', '~> 1.0.0.pre1'

# WYSIWYG
gem 'ckeditor'

# authorization
gem "cancan"

# local variables
gem "figaro"

# calendar gem
gem 'fullcalendar-rails'
gem 'momentjs-rails'

# For image uploading
gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"

# For authentification
gem 'devise'


gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'sqlite3', group: :development

group :production do 
	gem 'rails_12factor'
	gem 'pg'
end


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Rspec test 
  gem 'rspec-rails', '~>3.0'
  
  # Heroku recommends to add this for devise mailer 
  gem 'foreman'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

