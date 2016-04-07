# This is important, do not remove, and ensure it's included in every test or
# ensure this file is included
ENV["RACK_ENV"] = "test"

require "rubygems"
require "bundler/setup"

begin
  require "pry"
rescue LoadError
end

require "minitest/autorun"
require "rack/test"

# Project requires
require "./lib/server"
Dir.glob("./app/**/*.rb").each { |file| require file }

db_config = YAML.load(File.read(File.expand_path("config/database.yml")))
ActiveRecord::Base.establish_connection(db_config["test"])
