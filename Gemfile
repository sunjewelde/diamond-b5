source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', group: :development
# gem 'sqlite3', group: :development
gem 'sqlite3'
# 本番ではpostgressを使用する
# gem 'pg', group: :production

gem 'mysql2', '~> 0.3.20', group: :production
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bootstrap-sass'
gem 'lazy_high_charts'
gem "chartkick"
gem 'kaminari'
gem 'ransack'
gem 'pry-byebug', group: :development
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'activeadmin', '~> 1.0.0.pre2'
gem 'devise'

gem "resque"
gem 'sidekiq'
gem 'sinatra', require: false
# gem 'capistrano-sidekiq'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'

  # Remove the following if your app does not use Rails
  gem 'capistrano-rails'

  # Remove the following if your server does not use RVM
  gem 'capistrano-rvm'
  
  gem 'capistrano-sidekiq', github: 'seuros/capistrano-sidekiq'
  
end

