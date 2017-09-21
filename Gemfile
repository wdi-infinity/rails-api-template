# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.4.1'

gem 'active_model_serializers', '~> 0.10.6'
gem 'bcrypt', '~> 3.1.11'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.1.3'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails', '~> 2.2.1'
  gem 'pry', '~> 0.10.4'
  gem 'pry-byebug', '~> 3.4.3'
  gem 'rspec-rails', '~> 3.6.1'
  gem 'rubocop', '~> 0.49.1'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'pry-rails', '~> 0.3.4'
  gem 'spring', '~> 1.6'
  gem 'spring-commands-rspec', '~> 1.0'
end

group :production do
  gem 'rails_12factor', '~> 0.0.3'
end
