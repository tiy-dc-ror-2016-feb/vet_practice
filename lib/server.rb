ENV["RACK_ENV"] ||= "development"

require "rubygems"
require "bundler/setup"
require "sinatra/base"
require "json"
require "active_record"
require "pry"

# Project requires
require "./lib/base_server"
Dir.glob("./app/**/*.rb").each { |file| require file }

db_config = YAML.load(File.read(File.expand_path("config/database.yml")))
ActiveRecord::Base.establish_connection(db_config["test"])

Tilt.register Tilt::ERBTemplate, "html.erb"

class Server < BaseServer
  # Each controller should be listed below
  use ::Controller::Homepage
  use ::Controller::Owner
end

Server.run! if $PROGRAM_NAME == __FILE__
