# Home Page 
get "/" do
  @title = "Findo"
  @header = "FINDO"
  erb :index
end


# Coming soon page
get "/coming_soon" do
  @title = "Sorry!"
  @header = "FINDO"
  erb :coming_soon
end


# Edit User/Pull User Info
get "/existing_user" do
  @title = "Edit"
  @header = "FINDO"
  erb :existing_user
end