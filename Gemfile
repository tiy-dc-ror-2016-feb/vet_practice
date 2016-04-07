source "https://rubygems.org"

gem "sinatra"
gem "activerecord"
gem "rake"
gem "sqlite3"

group :test, :development do
  gem "pry"
  gem "simplecov", require: false
  gem "minitest"
  gem "rack-test"
  gem "timecop"
end

group :production do
  gem "pg"
end
