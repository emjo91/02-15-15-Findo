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