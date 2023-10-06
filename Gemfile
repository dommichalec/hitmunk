source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 7.1.0'
gem 'bcrypt',                  '3.1.11'
gem 'faker',                   '1.7.3'
gem 'carrierwave',             '1.1.0'
gem 'mini_magick',             '4.7.0'
gem 'fog',                     '1.40.0'
gem 'will_paginate',           '3.1.5'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'bootstrap-sass',          '3.3.7'
gem 'puma',                    '3.9.1'
gem 'sass-rails', '5.0.8'
gem 'uglifier',                '3.2.0'
gem 'coffee-rails', '5.0.0'
gem 'jquery-rails', '4.3.2'
gem 'turbolinks',              '5.0.1'
gem 'jbuilder',                '2.6.1'
gem 'valid_url'
gem 'safe_target_blank', '>= 1.0.2'
gem 'mailboxer', github: 'mailboxer/mailboxer'
gem 'sinatra', github: 'sinatra/sinatra'
gem 'sidekiq'
gem 'skylight'
gem 'figaro'

group :development, :test do
  gem 'sqlite3', '1.3.13'
  gem 'byebug',  '9.0.6', platform: :mri
end

group :development do
  gem 'web-console', '3.6.0'
  gem 'listen',                '3.0.8'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.1.0'
  gem 'better_errors', '2.3.0'
  gem 'binding_of_caller',     '0.7.2'
end

group :test do
  gem 'rails-controller-testing', '1.0.3'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.14.1'
  gem 'guard-minitest',           '2.4.6'
end

group :production do
  gem 'pg', '0.20.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
