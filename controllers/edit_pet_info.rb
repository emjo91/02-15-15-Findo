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
  # Show the current info on this page.
  @serial_num = params["serial_num"] # Not sure that I can get rid of this? /edit_pet_cofnrim wasn't working without it? Unsure as to why.
  @array = Dog.find_by_serial_num(params)
  erb :"edit_pet/edit_pet_form"
end

# This IS working.
# Final step in editing the pet.
get "/edit_pet_confirm" do
  @title = "Confirm Pet Info"
  @header = "FINDO"
  @d = Dog.update(params)
  @d = Dog.new(params) # May need to add more to this object to ensure it displays everything correctly.
  erb :"edit_pet/edit_pet_confirm"
end