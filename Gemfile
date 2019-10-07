# msource 'https://rubygems.org'
# git_source(:github) { |repo| "https://github.com/#{repo}.git" }
source 'https://rubygems.org'
ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
group :production do
  gem 'wkhtmltopdf-binary'
  # gem 'wkhtmltopdf-heroku', '2.12.5.0'
end
gem 'wicked_pdf'
gem 'rails', '~> 5.2.3'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'pg', '~> 1.1', '>= 1.1.4'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
gem 'gmaps4rails'
gem 'geocoder'
gem "figaro"
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.3', '>= 4.3.1'
gem 'kaminari', '~> 1.1', '>= 1.1.1'
gem 'bootstrap4-kaminari-views', '~> 1.0', '>= 1.0.1'
gem 'jquery-rails', '~> 4.3', '>= 4.3.5'
gem 'simple_form', '~> 5.0'
gem 'devise', '~> 4.7', '>= 4.7.1'
gem 'faker', '~> 2.4'
gem 'factory_bot_rails', '~> 5.0', '>= 5.0.2'
gem 'pundit', '~> 2.1'
gem 'cocoon', '~> 1.2', '>= 1.2.14'
gem 'bootstrap-datepicker-rails', '~> 1.8', '>= 1.8.0.1'
gem 'friendly_id', '~> 5.2.4'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'hirb-unicode', '~> 0.0.5'
  gem 'rspec-rails', '~> 3.4', '>= 3.4.2'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'wkhtmltopdf-binary'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
