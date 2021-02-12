ENV['SINATRA_ENV'] ||= "development"
require 'pry'
require 'rack-flash'
require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])
# require 'dotenv/load'
require "dotenv"
Dotenv.load
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)
require_relative '../app/models/modules/slug.rb'
require './app/controllers/application_controller'
require_all 'app'
