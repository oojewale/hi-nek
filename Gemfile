source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'redis', '~> 4.0'
gem 'sidekiq'

gem 'devise'

# image upload
gem 'carrierwave', '~> 1.0'
gem 'rmagick', '~> 2.13.1'

gem 'activeadmin'

# pdf generator
gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

# signature
gem 'john_hancock'

# sms
gem 'twilio-ruby', '~> 5.20.1'

group :development, :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'capybara', '~> 2.13'
  gem 'dotenv-rails'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'selenium-webdriver'
end

group :development do
  gem 'annotate'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
