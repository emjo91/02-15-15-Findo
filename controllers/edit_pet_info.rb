# Edit Pet Info
# Goes to /edit_pet_form
get "/edit_pet_info" do
  @title = "Edit Pet Info"
  @header = "FINDO"
  erb :"edit_pet/edit_pet_info"
end

# Working
# Goes to /edit_pet_confirm
get "/edit_pet_form" do
  @title = "Edit Pet Info"
  @header = "FINDO"
  @id = Dog.find_id_by_serial_num(params)
  @temperament_id = Dog.find_temperament_id_by_serial_num(params)
  @owner_id = Dog.find_owner_id_by_serial_num(params)
  @serial_num = params["serial_num"] 
  @array = Dog.find_by_serial_num_iterate(params)
  erb :"edit_pet/edit_pet_form"
end

# This IS working.
# Final step in editing the pet.
get "/edit_pet_confirm" do
  @title = "Confirm Pet Info"
  @header = "FINDO"
  @d = Dog.update(params)
  @d = Dog.new(params) 
  redirect "/dog/#{@d.id}"
end


get "/dog/:id" do
  @title = "Owner Profile"
  @header = "FINDO"
  @d = Dog.find_by_id(params[:id])
  erb :dog
end