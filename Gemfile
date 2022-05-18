# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 7'

gem 'pg'
gem 'puma'

gem 'importmap-rails'
gem 'propshaft'
gem 'tailwindcss-rails'
gem 'view_component'

group :development, :test do
  gem 'debug'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end
