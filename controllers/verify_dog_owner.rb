# Goes to /veryify_new_user_and_dog_confirm
get "/verify_new_user_and_dog" do
  @title = "Verification"
  @header = "Verification"
  erb :"verify_dog_owner/verify_new_user_and_dog"
end

get "/verify_new_user_and_dog_confirm" do
  @title = "Verify"
  @header = "FINDO"
  @confirm = "Verification"
  id = Dog.find_id_by_serial_num(params) #should give me id the for the dog.
  owner_id = Owner.return_owner_id_by_phone_num(params)
  Dog.update_owner_id({"owner_id"=>owner_id, "id"=>id}) # not sure if I can put params there and have that workout...
  erb :"main/pages/confirm"
end