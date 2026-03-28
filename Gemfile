source 'https://rubygems.org'

ruby IO.read('.ruby-version').strip

gem 'concurrent-ruby', '1.3.4'
gem 'rails', '~> 7.0'
gem 'sinatra', require: nil

gem 'foreman'
gem 'puma'

gem 'bootstrap-kaminari-views', '0.0.5'
gem 'kaminari'

gem 'alphabetical_paginate', github: 'benlovell/alphabetical_paginate'
gem 'deprecated_columns', '0.1.0'
gem 'govuk_admin_template', '~> 6.2.0'
gem 'pg'

gem 'rails-html-sanitizer', '1.4.4'

# This change was made via Snyk to fix a vulnerability
gem 'nokogiri', '>= 1.7.0.1'

gem 'addressable', '~> 2.8.9'
gem 'bugsnag'
gem 'json'

gem 'plek'
gem 'whenever', '~> 0.9.4', require: false

gem 'uuid'

# Gems used to provide Authentication and Authorization services.
# This change was made via Snyk to fix a vulnerability
gem 'devise', '>= 4.2.0'
gem 'devise-encryptable', '0.2.0'
gem 'devise_invitable'
gem 'devise_zxcvbn'
gem 'pundit', '0.3.0'
gem 'rotp', '~> 2.1.1'
gem 'rqrcode'

# This change was made via Snyk to fix a vulnerability
gem 'ancestry', '3.0.7'
gem 'doorkeeper'

gem 'activejob-retry'
gem 'gds-api-adapters'
gem 'sidekiq', '~> 6'
gem 'statsd-ruby', '1.1.0'

gem 'redis'
gem 'redis-namespace'
gem 'rexml'

gem 'zeroclipboard-rails'

gem 'rake'

gem 'sass-rails', '~> 5.0.6'
gem 'sprockets-rails', '~> 3.1.1'

# This change was made via Snyk to fix a vulnerability
gem 'uglifier', '>= 3.0.4'

group :development do
  gem 'better_errors', '2.8.0'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'jasmine'
  gem 'pry-byebug'
  gem 'rubocop', require: false
  gem 'scss_lint', '~> 0.60', require: false
end

group :test do
  gem 'capybara', '~> 3'
  gem 'capybara-email', '~> 3'
  gem 'ci_reporter', '1.7.0'
  gem 'database_cleaner', '1.6.2'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'minitest', '~> 5.8.0'
  gem 'minitest-retry'
  gem 'mocha', '1.1.0', require: false
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 4.1'
  gem 'selenium-webdriver'
  gem 'shoulda-context', require: false
  gem 'timecop', '0.7.1'
  gem 'webmock'
end

group :staging, :production do
  gem 'rails_12factor'
end
