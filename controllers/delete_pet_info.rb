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