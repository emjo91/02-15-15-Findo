# The owner ID is passed along to this page from the previous page. - this is no longer the case 02/22/15
# New Dog Set Up
# goes to new_info_confirmed
get "/new_user_dog" do
  @title = "Add a Pet"
  @header = "FINDO"
  erb :"new_dog/new_user_dog"
end

# Goes to verify_new_user_and_dog
# Need to make a form that inserts the owner's ID into the next page
# Owner ID and temperament ID will get changed.s
# I'm not sure why the owner id isn't working, or temperament id...but...this is the only way it seems to work...so meh. It works for now.
# If the code is suddenly not running...you may need to assign an @variable for temperament_id and owner_id...just sayin.

# I wasn't able to get named parameters for this path...Idk if it's because it's a brand new user??
get "/new_info_confirmed" do
  @title = "Confirmed"
  @header = "FINDO"
  @d = Dog.new(params)
  @d.temperament_id = 1 # Unable to get rid of these...for now.
  @d.owner_id = 1 # Unable to get rid of these...for now.
  @d.insert
  @d = Dog.new(params)
  # @id = Dog.find_id_by_serial_num(params[:id]) # not sure if this will work.
  binding.pry
  erb :"new_dog/new_info_confirmed"
end
