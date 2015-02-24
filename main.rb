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
require_relative 'helpers/helper.rb'

DATABASE.results_as_hash = true

helpers FindoHelper


# Home Page 
get "/" do
  @title = "Findo"
  @header = "FINDO"
  erb :index
end

# Coming soon page
get "/coming_soon" do
  @title = "Sorry!"
  @header = "FINDO"
  erb :coming_soon
end

# Found Pet - This page will display owner and dog info.
get "/found_pet" do
  @title = "FOUND"
  @header = "FOUNDO"
  @serial_num = params["serial_num"]
  @array2 = Temperament.return_dog_temperament_by_serial_num(params)
  @array = Owner.return_all_dog_owner_info(params)
  erb :found_pet
end

# Working
get "/found_pet_email_send" do
  @title = "Found"
  @header = "FINDO"
  @confirm = "Sent email"
  send_email
  erb :confirm
end


# New User Set Up
# Goes to /new_user_confirmed
get "/new_user" do
  @title = "Sign Up"
  @header = "SIGN UP"
  erb :new_user
end

# Goes to add a dog/pet...whatever.
# For some reason, not able to pass along the owner ID more than one page...
get "/new_user_confirmed" do
  @title = "Sign Up"
  @header = "Confirmation"
  @o = Owner.new(params)
  @o.insert
  erb :new_user_confirmed
end


# The owner ID is passed along to this page from the previous page. - this is no longer the case 02/22/15
# New Dog Set Up
# goes to new_info_confirmed
get "/new_user_dog" do
  @title = "Add a Pet"
  @header = "FINDO"
  erb :new_user_dog
end

# Goes to verify_new_user_and_dog
# Need to make a form that inserts the owner's ID into the next page
# Owner ID and temperament ID will get changed.s
# I'm not sure why the owner id isn't working, or temperament id...but...this is the only way it seems to work...so meh. It works for now.
# If the code is suddenly not running...you may need to assign an @variable for temperament_id and owner_id...just sayin.
get "/new_info_confirmed" do
  @title = "Confirmed"
  @header = "FINDO"
  @d = Dog.new(params)
  @d.temperament_id = 1 # Unable to get rid of these...for now.
  @d.owner_id = 1 # Unable to get rid of these...for now.
  @d.insert
  erb :new_info_confirmed
end

# Goes to /veryify_new_user_and_dog_confirm
get "/verify_new_user_and_dog" do
  @title = "Verification"
  @header = "Verification"
  erb :verify_new_user_and_dog
end

get "/verify_new_user_and_dog_confirm" do
  @title = "Verify"
  @header = "FINDO"
  @confirm = "Verification"
  id = Dog.find_id_by_serial_num(params) #should give me id the for the dog.
  owner_id = Owner.return_owner_id_by_phone_num(params)
  Dog.update_owner_id({"owner_id"=>owner_id, "id"=>id}) # not sure if I can put params there and have that workout...
  erb :confirm
end

# Edit User/Pull User Info
get "/existing_user" do
  @title = "Edit"
  @header = "FINDO"
  erb :existing_user
end

# Checking pet info...
# Has form with serial_num
# goes to /display_pet_info
get "/check_pet_info" do
  @title = "View Pet Info"
  @header = "FINDO"
  erb :check_pet_info
end

# Displays pet info from serial_num
# This works.
get "/display_pet_info" do
  @title = "View Pet Info"
  @header = "FINDO"
  @array = Dog.find_by_serial_num(params)
  @array2 = Temperament.return_dog_temperament_by_serial_num(params)
  erb :display_pet_info
end


# Edit Pet Info
# Goes to /edit_pet_form
get "/edit_pet_info" do
  @title = "Edit Pet Info"
  @header = "FINDO"
  erb :edit_pet_info
end

# Working
# Goes to /edit_pet_confirm
get "/edit_pet_form" do
  @title = "Edit Pet Info"
  @header = "FINDO"
  # Show the current info on this page.
  @serial_num = params["serial_num"] # Not sure that I can get rid of this? /edit_pet_cofnrim wasn't working without it? Unsure as to why.
  @array = Dog.find_by_serial_num(params)
  erb :edit_pet_form
end

# This IS working.
# Final step in editing the pet.
get "/edit_pet_confirm" do
  @title = "Confirm Pet Info"
  @header = "FINDO"
  @d = Dog.update(params)
  @d = Dog.new(params) # May need to add more to this object to ensure it displays everything correctly.
  erb :edit_pet_confirm
end

# Edit Owner Info
# Goes to /edit_owner_form
get "/edit_owner_info" do
  @title = "View Owner Info"
  @header = "FINDO"
  erb :edit_owner_info
end


# This edits the owner's information with serial_num
# This page goes to /edit_owner_confirm
# This is where it may be convient to pull up the object to edit? After acquiring the serial_num? Go to page ex: /edit_owner_form/3 instead of /edit_owner?serial_num = 221312
get "/edit_owner_form" do
  @title = "Edit Owner"
  @header = "FINDO"
  @serial_num = params["serial_num"] # "/edit_owner_confirm" will not work without this...unsure of why...
  @array = Owner.return_owner_info_by_serial_num(params)
  erb :edit_owner_form
end


# I'm not sure why this isn't working. Should work. Coming up with
# the same error when I had to wait it out...
get "/edit_owner_confirm" do
  @title = "Edit Owner"
  @header = "FINDO"
  # used to have serial_num params here...
  @id = Owner.return_owner_id_by_serial_num(params)
  Owner.update(params)
  @o = Owner.new(params)
  erb :edit_owner_confirm
end


# Starting page for deleting pet info. Goes to /delete_pet_hesitate
get "/delete_pet_info" do
  @title = "Delete Pet Info"
  @header = "FINDO"
  erb :delete_pet_info
end

# Display info to be deleted...then onto /delete_pet_confirm
get "/delete_pet_hesitate" do
  @title = "Delete Pet Info"
  @header = "FINDO"
  @serial_num = params["serial_num"] # "/delete_pet_confirm" will not work without this parameter...
  @array = Dog.find_by_serial_num(params)
  erb :delete_pet_hesitate
end


# THIS WORKS!
get "/delete_pet_confirm" do
  @title = "Delete Pet Confirm"
  @header = "FINDO"
  @confirm = "Deletion"
  @id = Dog.find_id_by_serial_num(params)
  @d = Dog.delete_record({"table"=>"dogs", "id"=>@id})
  # If I were to make a new dog object here...it would only have the id...
  erb :confirm
end


# This will be a form page that requires serial number of dog...then a drop down for the temperament.
get "/add_temperament" do
  @title = "Temperament"
  @header = "FINDO"
  erb :add_temperament
end
  
get "/add_temperament_confirm" do
  @title = "Temperament"
  @header = "FINDO"
  # used to have serial_num here if something goes wrong...
  @temperament = params["temperament"] # Not sure if I can get around not having this one...
  temperament_id = Temperament.temperament_id(params)
  id = Dog.find_id_by_serial_num(params) #should give me the for the dog.
  Dog.update_temperament_id({"temperament_id"=>temperament_id, "id"=>id})
  erb :add_temperament_confirm
end