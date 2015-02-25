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
  @id = Owner.return_owner_id_by_serial_num(params) 
  @array = Owner.return_owner_info_by_serial_num(params)
  erb :edit_owner_form
end


# I'm not sure why this isn't working. Should work. Coming up with
# the same error when I had to wait it out...
get "/edit_owner_confirm/:id" do
  @title = "Edit Owner"
  @header = "FINDO"
  Owner.update(params)
  @o = Owner.new(params)
  @id = (params[:id]) 
  erb :edit_owner_confirm
end
