# Home Page 
get "/" do
  @title = "Findo"
  @header = "FINDO"
  erb :"main_pages/index"
end


# Coming soon page
get "/coming_soon" do
  @title = "Sorry!"
  @header = "FINDO"
  erb :"main_pages/coming_soon"
end


# Edit User/Pull User Info
get "/existing_user" do
  @title = "Edit"
  @header = "FINDO"
  erb :"main_pages/existing_user"
end