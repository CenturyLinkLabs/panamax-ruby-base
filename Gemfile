source 'https://rubygems.org'

gem 'rails', '4.1.0'

gem 'sass'
gem 'therubyracer', platforms: :ruby
gem 'haml'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'uglifier', '>= 1.3.0'
gem 'ctl_base_ui', path: '../ctl-base-ui'
gem 'faraday', '0.8.9'

gem 'sqlite3'
gem 'faraday_middleware', '0.9.0'
gem 'jbuilder', '~> 2.0'
gem 'docker-api', '1.9.0', require: 'docker'
gem 'active_model_serializers'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test, :development do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'teaspoon'
  gem 'phantomjs', '>= 1.8.1.1'
  gem 'dotenv-rails'
  gem 'shoulda-matchers'
end

group :test do
  gem 'webmock'
  gem 'sinatra'
  gem 'coveralls'
  gem 'database_cleaner'
end
