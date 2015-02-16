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

# New User Set Up
get "/new_user" do
  @title = "Sign Up"
  @header = "SIGN UP"
  erb :new_user, :layout => :boilerplate
end

get "/new_user_dog" do
  @title = "Sign Up"
  @header = "SIGN UP"
  erb :new_user_dog, :layout => :boilerplate
end

get "/new_user_confirmed" do
  @title = "Confirmed"
  @header = "FINDO"
  erb :new_user_confirmed, :layout => :boilerplate
end

# Edit User/Pull User Info
get "/existing_user" do
  @title = "Edit"
  @header = "FINDO"
  erb :existing_user, :layout => :boilerplate
end

get "/check_pet_info" do
  @title = "View Info"
  @header = "FINDO"
  erb :check_pet_info, :layout => :boilerplate
end

get "/view_pet_info" do
  @title = "View Info"
  @header = "FINDO"
  erb :view_pet_info, :layout => :boilerplate
end
  