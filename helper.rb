module FindoHelper
  

  def send_email
    Pony.mail({
      :from => 'findodonotreply@gmail.com', 
      :to => params[:email],
      :subject => params[:subject], 
      :body => params[:body],
      :via => :smtp,
      :via_options            => {
        :address              => 'smtp.gmail.com', 
        :port                 => '587', 
        :enable_starttls_auto => true,
        :user_name            => 'findodonotreply',
        :password             => 'password',
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
   
