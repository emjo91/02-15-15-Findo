module FindoHelper
  
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
  
  def display_iteration
    #will put some code here.
  end
  
end