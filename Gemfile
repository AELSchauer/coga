source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "rails", "~> 5.0.5"
# Use postgresql as the database for Active Record
gem "pg", "~> 0.18"
# Use Puma as the app server
gem "puma", "~> 3.0"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 3.0"
# Use ActiveModel has_secure_password
gem "bcrypt", "~> 3.1.7"

# Use Capistrano for deployment
# gem "capistrano-rails", group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

gem "apitome"
gem "jquery-rails"
gem "jwt"
gem "rspec_api_documentation"

group :development, :test do
  gem "capybara"
  gem "database_cleaner"
  gem "factory_bot_rails"
  gem "faker"
  gem "guard-rspec"
  gem "launchy"
  gem "pry"
  gem "rspec-rails"
  gem "rubocop-rspec"
  gem "shoulda-matchers"
end

group :development do
  gem "listen", "~> 3.0.5"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Issue with version "1.9.25" so overwrite with lower version
gem "ffi", "1.9.18"
