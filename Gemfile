source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '~> 4.0'
gem 'pg'
gem 'active_model_serializers'
gem 'activejob', require: 'active_job'
gem 'activemodel-globalid', github: 'rails/activemodel-globalid'
gem 'activejob-scheduler'
gem 'sidekiq'
gem 'iceburn', github: 'tubbo/iceburn', branch: 'master'
gem 'puma'
gem 'bcrypt', '~> 3.1.7'

gem 'sass-rails'
gem 'coffee-rails'
gem 'foundation-rails'
gem 'uglifier',         '~> 1.3'

gem 'jquery-rails',     '2.2.2'
gem 'ember-rails'
gem 'emblem-rails'
gem 'ember_script-rails'

group :development do
  gem 'meta_request'
  gem 'quiet_assets'
  gem 'spring'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
end

group :test do
  gem 'rspec-rails'
end

group :production do
  gem 'rack-cache'
  gem 'asset_sync'
  gem 'redis-rails'
  gem 'redis-rack-cache'
end
