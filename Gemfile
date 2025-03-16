source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.1.3"
gem "puma", ">= 5.0"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Optional gems for image processing
gem "image_processing", ">= 1.2"  # If using image processing
gem "aws-sdk-s3", require: false   # If using AWS S3 for file uploads

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "sqlite3", "~> 1.4"  # For development environment only
  gem "tabulo"
  gem "web-console"
end

group :production do
  gem "pg"  # PostgreSQL for production
  gem "rails_12factor", group: :production # Add this if you're deploying to platforms like Heroku or Render that require it
end
