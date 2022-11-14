# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'aasm', '~> 5.3.1'
gem 'devise', '~> 4.8.1'
gem 'haml-rails', '~> 2.1.0'
gem 'mini_magick', '~> 4.11.0'
gem 'net-smtp', '~> 0.3.2', require: false
gem 'omniauth', '~> 2.1.0'
gem 'omniauth-facebook', '~> 9.0.0'
gem 'pagy', '~> 5.10.1'
gem 'pundit', '~> 2.2.0'
gem 'sassc-rails', '2.1.2'
gem 'shrine', '~> 3.4.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console

  gem 'byebug', '~> 11.1.3', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'faker', '~> 2.23.0'
  gem 'pry', '~> 0.14.1'
  gem 'rspec-rails', '~> 5.1.2'
  gem 'rubocop', '~> 1.36.0'
  gem 'rubocop-performance', '~> 1.15.0'
  gem 'rubocop-rails', '~> 2.16.1', require: false
  gem 'rubocop-rspec', '~> 2.13.2', require: false
end

group :production do
  gem 'net-imap', '0.3.1'
  gem 'net-pop', '0.1.2'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '4.1.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'rails-controller-testing', '~> 1.0.5'
  gem 'shoulda-matchers', '~> 5.2.0'
  gem 'simplecov', '~> 0.21.2'
  gem 'webdrivers', '~> 5.2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
