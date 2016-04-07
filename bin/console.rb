ENV["RACK_ENV"] ||= "development"

require "rubygems"
require "bundler/setup"
require "sinatra/base"
require "active_record"
require "json"
require "pry"

# Project requires
require "./lib/base_server"
Dir.glob("./app/**/*.rb").each { |file| require file }

db_config = YAML.load(File.read(File.expand_path("config/database.yml")))
ActiveRecord::Base.establish_connection(db_config["test"])

binding.pry
