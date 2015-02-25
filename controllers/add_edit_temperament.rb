# This will be a form page that requires serial number of dog...then a drop down for the temperament.
get "/add_temperament" do
  @title = "Temperament"
  @header = "FINDO"
  erb :"add_edit_temperament/add_temperament"
end
  
get "/add_temperament_confirm" do
  @title = "Temperament"
  @header = "FINDO"
  # used to have serial_num here if something goes wrong...
  @temperament = params["temperament"] # Not sure if I can get around not having this one...
  temperament_id = Temperament.temperament_id(params)
  id = Dog.find_id_by_serial_num(params) #should give me the for the dog.
  Dog.update_temperament_id({"temperament_id"=>temperament_id, "id"=>id})
  erb :"add_edit_temperament/add_temperament_confirm"
end