source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'blazer'
gem 'bootstrap_form'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-sass'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.3'
gem 'redis', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'twitter-bootstrap-rails'
gem 'uglifier', '>= 1.3.0'
gem 'omniauth-facebook'
gem 'figaro'
gem 'geocoder'
gem 'active_model_serializers', '~> 0.10.0'
gem 'geokit-rails'
gem 'bcrypt'
gem 'twilio-ruby'
gem 'passenger'
gem 'geokit'
gem "paperclip", "~> 5.0.0"
gem 'aws-sdk', '~> 2.3'
gem "jquery-fileupload-rails"
gem 'faker'

group :test do
  gem 'vcr'
  gem 'webmock'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'shoulda-callback-matchers', '~> 1.1.1'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development, :test do
  gem 'pry'
  gem 'awesome_print', require: 'ap'
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'rack_session_access'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem 'better_errors'
  gem 'binding_of_caller'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# gem 'therubyracer', platforms: :ruby
# gem 'bcrypt', '~> 3.1.7'
# gem 'capistrano-rails', group: :development
