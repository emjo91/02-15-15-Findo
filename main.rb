require 'sinatra'
require 'pry'
require 'sqlite3'
# DATABASE = SQLite3::Database.new("findo_database.db")
require_relative 'models/dog_class.rb'
require_relative 'models/owner_class.rb'
require_relative 'models/temperament_class.rb'
require_relative 'models/class_module'
require_relative 'models/database_setup.rb'

DATABASE.results_as_hash = true


# Home Page 
get "/" do
  @title = "Findo"
  erb :index, :layout => :boilerplate
end