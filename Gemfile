source 'https://rubygems.org'

ruby IO.read('.ruby-version').strip

gem 'rails', '~> 5.2.0'
gem 'sinatra', require: nil

gem 'foreman'
gem 'puma'
gem 'newrelic_rpm'

gem 'kaminari', '~> 1.2'
gem 'bootstrap-kaminari-views', '0.0.5'

gem 'alphabetical_paginate', '2.2.3'
gem 'pg', '~> 0.18'
gem 'govuk_admin_template', '~> 6.2.0'
gem 'deprecated_columns', '0.1.0'

gem 'rails-html-sanitizer', '1.0.4'

# This change was made via Snyk to fix a vulnerability
gem 'nokogiri', '>= 1.7.0.1'

gem 'bugsnag'
gem 'json'
gem 'addressable', '~> 2.8.0'

gem 'plek'
gem 'whenever', '~> 0.9.4', require: false

gem 'uuid'

# Gems used to provide Authentication and Authorization services.
# This change was made via Snyk to fix a vulnerability
gem 'devise', '>= 4.2.0'
gem 'devise_invitable', '1.7.0'
gem 'devise-encryptable', '0.2.0'
gem 'devise_zxcvbn', '1.1.1'
gem 'pundit', '0.3.0'
gem 'rotp', '~> 2.1.1'
gem 'rqrcode'

# This change was made via Snyk to fix a vulnerability
gem 'doorkeeper', '5.1.1'
gem 'ancestry', '3.0.7'

gem 'gds-api-adapters'
gem 'statsd-ruby', '1.1.0'
gem 'sidekiq', '~> 4.1.0'
gem 'activejob-retry'

gem 'redis'
gem 'redis-namespace'

gem 'zeroclipboard-rails'

gem 'rake', '10.4.1'

gem 'sass-rails', '~> 5.0.6'
gem 'sprockets-rails', '~> 3.1.1'

# This change was made via Snyk to fix a vulnerability
gem 'uglifier', '>= 3.0.4'

group :development do
  gem 'better_errors', '2.1.1'
  gem 'binding_of_caller', '0.7.2'
end

group :development, :test do
  gem 'jasmine', '2.8.0'
  gem 'govuk-lint', '~> 0.4'
  gem 'pry-byebug'
end

group :test do
  gem 'rspec-rails', '~> 3.9'
  gem 'rails-controller-testing'
  gem 'capybara', '~> 3'
  gem 'capybara-email', '~> 3'
  gem 'poltergeist', '~> 1'
  gem 'database_cleaner', '1.6.2'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'mocha', '1.1.0', require: false
  gem 'webmock'
  gem 'minitest', '~> 5.8.0'
  gem 'ci_reporter', '1.7.0'
  gem 'timecop', '0.7.1'
  gem 'shoulda-context', '1.2.1', require: false
  gem 'phantomjs-binaries'
end

group :staging, :production do
  gem 'rails_12factor'
end
