# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'pg'
gem 'puma' #, '~> 4.1'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap' #, '>= 1.4.2', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
gem 'travis', '~> 1.8', '>= 1.8.10'

# Enable use of human friendly object ids instead of numbers
gem 'friendly_id'

# Build a powerful GraphQL api
gem 'graphql'

# Allow for quick, programatic expansion of recurring date rules
gem 'ice_cube'

# devise
gem 'devise'
gem 'devise-jwt' #, '~> 0.5.9'
gem 'dry-configurable' #, '0.9.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'spring-commands-rspec'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'delorean'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'rspec-rails'  #, '~> 4.0.0.beta2'
  gem 'shoulda-matchers'  #, '~> 4.1', '>= 4.1.2'
  gem 'rubocop'  #, '~> 0.84.0', require: false
  gem 'rubocop-rails'  #, '~> 2.5', '>= 2.5.2', require: false
  gem 'rubocop-performance'  #, '~> 1.6', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'graphiql-rails' #, '~> 1.7'
end

gem 'coveralls', require: false

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
