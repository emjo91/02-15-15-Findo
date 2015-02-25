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