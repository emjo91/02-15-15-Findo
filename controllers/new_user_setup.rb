# New User Set Up
# Goes to /new_user_confirmed
get "/new_user" do
  @title = "Sign Up"
  @header = "SIGN UP"
  erb :"new_user_setup/new_user"
end

# Goes to add a dog/pet...whatever.
# For some reason, not able to pass along the owner ID more than one page...
get "/new_user_confirmed" do
  @title = "Sign Up"
  @header = "Confirmation"
  @o = Owner.new(params)
  @o.insert
  binding.pry
  erb :"new_user_setup/new_user_confirmed"
end