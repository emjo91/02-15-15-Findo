# Checking pet info...
# Has form with serial_num
# goes to /display_pet_info
get "/check_pet_info" do
  @title = "View Pet Info"
  @header = "FINDO"
  erb :"check_pet_info/check_pet_info"
end

# Displays pet info from serial_num
# This works.
get "/display_pet_info" do 
  @title = "View Pet Info"
  @header = "FINDO"
  @id = Dog.find_id_by_serial_num(params)
  redirect "/dog/#{@id}"
  # erb :"check_pet_info/display_pet_info"
end