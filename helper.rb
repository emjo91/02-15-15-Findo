module FindoHelper
  
  def try_this
    Pony.mail :to => params[:email],
              :from => "me@example.com",
              :subject => "Thanks for signing my guestbook, #{params[:name]}!",
              :body => params[:body]
  end
  
  #Not sure if this will actually work...we will see.
  def message_from_findo
    Pony.mail({
      :from => 'findodonotreply@gmail.com', 
      :to => params[:email],
      :subject => params[:open_line], 
      :body => params[:message],
      :via => :smtp,
      :via_options            => {
        :address              => 'smtp.gmail.com', 
        :port                 => '587', 
        :enable_starttls_auto => true,
        :user_name            => 'findodonotreply',
        :password             => 'findofindo',
        :authentication       => :plain,
        :domain               => 'localhost.localdomain'
      }}) 
  end
  
  
  # Working on some code for this...
  def display_iteration
    #will put some code here.
  end
  
  
  # This will display a temperament response based on choice.
  def temperament_response(temperament)
    if temperament == "Impish" || temperament == "Timid" || temperament == "Jolly" || temperament == "Naive" || temperament == "Modest" || temperament == "Bashful" || temperament == "Quirky" || temperament == "Gentle"
      return "how cute!!"
    elsif temperament == "Hardy" || temperament == "Brave" || temperament == "Adamant" || temperament == "Naughty" || temperament == "Bold" || temperament == "Hasty" || temperament == "Rash" || temperament == "Sassy"
      return "you have your work cut out for you!"
    else 
      return "great!"
    end
  end 
  
end
   
