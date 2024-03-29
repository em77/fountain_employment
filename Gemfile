source 'https://rubygems.org'

ruby '2.4.10'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11.3'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'bootstrap-sass'
# Use PostgreSQL
gem 'pg'
# Use pg_search for searching
gem 'pg_search'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# For uploading files
gem 'paperclip', '~> 6'
# For AWS S3
gem 'aws-sdk-s3'
# For authentication
gem 'sorcery'
# Pagination
gem 'will_paginate'
# will_paginate integration with bootstrap
gem 'will_paginate-bootstrap'
# Date picker in Bootstrap style
gem 'bootstrap-datepicker-rails'
# Fake data generator for testing
gem 'faker'
# Unions between multiple ActiveRecord queries
gem 'active_record_union'

gem 'rails-jquery-autocomplete'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails', '5.0.5'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Puma as the app server
gem 'puma', '~> 3.11'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use Capistrano for deployment
  gem 'capistrano'
  gem 'capistrano-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'rack-timeout'
end
