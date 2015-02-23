require 'sinatra'
require 'pry'
require 'sqlite3'
require 'pony'
# DATABASE = SQLite3::Database.new("findo_database.db")
require_relative 'models/dog_class.rb'
require_relative 'models/owner_class.rb'
require_relative 'models/temperament_class.rb'
require_relative 'models/class_module'
require_relative 'models/database_setup.rb'
require_relative 'models/pony_class.rb'
require_relative 'helper.rb'

DATABASE.results_as_hash = true

helpers FindoHelper


# Home Page 
get "/" do
  @title = "Findo"
  @header = "FINDO"
  erb :index, :layout => :boilerplate
end

# Coming soon page
get "/coming_soon" do
  @title = "Sorry!"
  @header = "FINDO"
  erb :coming_soon, :layout => :boilerplate
end

# Found Pet - This page will display owner and dog info.
# Need to get email working.
get "/found_pet" do
  @title = "FOUND"
  @header = "FOUNDO"
  @serial_num = params["serial_num"]
  @array2 = Temperament.return_dog_temperament_by_serial_num(params)
  @array = Owner.return_all_dog_owner_info(params)
  @email = Owner.return_email_by_serial_num(params)
  erb :found_pet, :layout => :boilerplate
end

# This is a WIP...idk if it'll actually work. Crossing fingers.
# Can't seem to get it to take variables as the parameters.
get "/found_pet_email_send" do
  @title = "Found"
  @header = "FINDO"
  send_email
  erb :found_pet_email_send, :layout => :boilerplate
end


# New User Set Up
# Goes to /new_user_confirmation
get "/new_user" do
  @title = "Sign Up"
  @header = "SIGN UP"
  erb :new_user, :layout => :boilerplate
end


# Goes to add a dog/pet...whatever.
# For some reason, not able to pass along the owner ID more than one page...
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


# The owner ID is passed along to this page from the previous page. - this is no longer the case 02/22/15
# New Dog Set Up
# goes to new_info_confirmed
get "/new_user_dog" do
  @title = "Add a Pet"
  @header = "FINDO"
  erb :new_user_dog, :layout => :boilerplate
end

# Goes to verify_new_user_and_dog
# Need to make a form that inserts the owner's ID into the next page
# Owner ID and temperament ID will get changed.s
# I'm not sure why the owner id isn't working, or temperament id...but...this is the only way it seems to work...so meh. It works for now.
get "/new_info_confirmed" do
  @title = "Confirmed"
  @header = "FINDO"
  @name = params["name"]
  @breed = params["breed"]
  @age = params["age"]
  @colour = params["colour"]
  @description = params["description"]
  @temperament_id = 1
  @temperament_id = 1
  @d = Dog.new(params)
  @d.temperament_id = 1
  @d.owner_id = 1
  @d.insert
  erb :new_info_confirmed, :layout => :boilerplate
end

# Goes to /veryify_new_user_and_dog_confirm
get "/verify_new_user_and_dog" do
  @title = "Verification"
  @header = "Verification"
  erb :verify_new_user_and_dog, :layout => :boilerplate
end

get "/verify_new_user_and_dog_confirm" do
  @title = "Verify"
  @header = "FINDO"
  @phone_num = params["phone_num"]
  @serial_num = params["serial_num"]
  id = Dog.find_id_by_serial_num(params) #should give me the for the dog.
  owner_id = Owner.return_owner_id_by_phone_num(params)
  Dog.update_owner_id({"owner_id"=>owner_id, "id"=>id})
  erb :verify_new_user_and_dog_confirm, :layout => :boilerplate
end

# Edit User/Pull User Info
get "/existing_user" do
  @title = "Edit"
  @header = "FINDO"
  erb :existing_user, :layout => :boilerplate
end

# Checking pet info...
# Has form with serial_num
# goes to /display_pet_info
get "/check_pet_info" do
  @title = "View Pet Info"
  @header = "FINDO"
  erb :check_pet_info, :layout => :boilerplate
end

# Displays pet info from serial_num
# This works.
get "/display_pet_info" do
  @title = "View Pet Info"
  @header = "FINDO"
  @serial_num = params["serial_num"]
  @array = Dog.find_by_serial_num(params)
  @array2 = Temperament.return_dog_temperament_by_serial_num(params)
  erb :display_pet_info, :layout => :boilerplate
end


# Edit Pet Info
# Goes to /edit_pet_form
get "/edit_pet_info" do
  @title = "Edit Pet Info"
  @header = "FINDO"
  erb :edit_pet_info, :layout => :boilerplate
end

# Working
# Goes to /edit_pet_confirm
get "/edit_pet_form" do
  @title = "Edit Pet Info"
  @header = "FINDO"
  # Show the current info on this page.
  @serial_num = params["serial_num"]
  @array = Dog.find_by_serial_num(params)
  erb :edit_pet_form, :layout => :boilerplate
end

# This IS working.
# Final step in editing the pet.
get "/edit_pet_confirm" do
  @title = "Confirm Pet Info"
  @header = "FINDO"
  @serial_num = params["serial_num"]
  @name = params["name"]
  @breed = params["breed"]
  @colour = params["colour"]
  @age = params["age"]
  @description = params["description"]
  @a = Dog.update(params)
  erb :edit_pet_confirm, :layout => :boilerplate
end

# Edit Owner Info
# Goes to /edit_owner_form
get "/edit_owner_info" do
  @title = "View Owner Info"
  @header = "FINDO"
  erb :edit_owner_info, :layout => :boilerplate
end

# This edits the owner's information with serial_num
# This page goes to /edit_owner_confirm
get "/edit_owner_form" do
  @title = "Edit Owner"
  @header = "FINDO"
  @serial_num = params["serial_num"]
  @array = Owner.return_owner_info_by_serial_num(params)
  erb :edit_owner_form, :layout => :boilerplate
end

# I'm not sure why this isn't working. Should work. Coming up with
# the same error when I had to wait it out...
get "/edit_owner_confirm" do
  @title = "Edit Owner"
  @header = "FINDO"
  @serial_num = params["serial_num"]
  @id = Owner.return_owner_id_by_serial_num(params)
  @name = params["name"]
  @secondary_owner = params["secondary_owner"]
  @phone_num = params["phone_num"]
  @email = params["email"]
  @address = params["address"]
  @city = params["city"]
  @state = params["state"]
  @zip = params["zip"]
  @o = Owner.update(params)
  erb :edit_owner_confirm, :layout => :boilerplate
end


# Starting page for deleting pet info. Goes to /delete_pet_hesitate
get "/delete_pet_info" do
  @title = "Delete Pet Info"
  @header = "FINDO"
  erb :delete_pet_info, :layout => :boilerplate
end

# Display info to be deleted...then onto /delete_pet_confirm
get "/delete_pet_hesitate" do
  @title = "Delete Pet Info"
  @header = "FINDO"
  @serial_num = params["serial_num"]
  @array = Dog.find_by_serial_num(params)
  erb :delete_pet_hesitate, :layout => :boilerplate
end

# THIS WORKS!
get "/delete_pet_confirm" do
  @title = "Delete Pet Confirm"
  @header = "FINDO"
  @serial_num = params["serial_num"]
  @id = Dog.find_id_by_serial_num(params)
  Dog.delete_record({"table"=>"dogs", "id"=>@id})
  erb :delete_pet_confirm, :layout => :boilerplate
end


# This will be a form page that requires serial number of dog...then a drop down for the temperament.
get "/add_temperament" do
  @title = "Temperament"
  @header = "FINDO"
  erb :add_temperament, :layout => :boilerplate
end
  
get "/add_temperament_confirm" do
  @title = "Temperament"
  @header = "FINDO"
  @serial_num = params["serial_num"]
  @temperament = params["temperament"]
  temperament_id = Temperament.temperament_id(params)
  id = Dog.find_id_by_serial_num(params) #should give me the for the dog.
  Dog.update_temperament_id({"temperament_id"=>temperament_id, "id"=>id})
  erb :add_temperament_confirm, :layout => :boilerplate
end