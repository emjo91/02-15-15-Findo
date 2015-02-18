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
  @header = "FINDO"
  erb :index, :layout => :boilerplate
end

# Found Pet
get "/found_pet" do
  @title = "Found!"
  @header = "FINDO"
  erb :found_pet, :layout => :boilerplate
end

# New User Set Up
# No methods here.
get "/new_user" do
  @title = "Sign Up"
  @header = "SIGN UP"
  erb :new_user, :layout => :boilerplate
end

# working - @email was being fussy though,
# for viewing purposes...may need to check.
get "/new_user_confirmed" do
  @title = "Sign Up"
  @header = "Confirmation"
  
  @name = params["name"]
  @secondary_owner = params["secondary_owner"]
  @phone_num = params["phone_num"]
  @email = params["email"]
  @address = params["address"]
  @city = params["city"]
  @state = params["state"]
  @zip = params["zip"]
  
  @o = Owner.new(params)
  @o.insert
  erb :new_user_confirmed, :layout => :boilerplate
end


# New Dog Set Up
get "/new_user_dog" do
  @title = "Sign Up"
  @header = "SIGN UP"
  erb :new_user_dog, :layout => :boilerplate
end

get "/new_info_confirmed" do
  @title = "Confirmed"
  @header = "FINDO"
  erb :new_info_confirmed, :layout => :boilerplate
end

# Edit User/Pull User Info
get "/existing_user" do
  @title = "Edit"
  @header = "FINDO"
  erb :existing_user, :layout => :boilerplate
end

get "/check_pet_info" do
  @title = "View Pet Info"
  @header = "FINDO"
  erb :check_pet_info, :layout => :boilerplate
end

get "/view_pet_info" do
  @title = "View Pet Info"
  @header = "FINDO"
  erb :view_pet_info, :layout => :boilerplate
end


get "/edit_pet_info" do
  @title = "Edit Pet Info"
  @header = "FINDO"
  erb :edit_pet_info, :layout => :boilerplate
end


get "/edit_owner_info" do
  @title = "View Owner Info"
  @header = "FINDO"
  erb :edit_owner_info, :layout => :boilerplate
end


get "/delete_pet_info" do
  @title = "Delete Pet Info"
  @header = "FINDO"
  erb :delete_pet_info, :layout => :boilerplate
end
  
  