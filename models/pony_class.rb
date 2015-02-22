require 'erb'
require 'pony'
require 'pry'
 
class Mailer
  
  
  def awesome_email(details)
    @to = "3mle33@gmail.com"
    @from = "3mle33@gmail.com"
    @subject = details[:subject]
    @body = details[:body]
    Pony.mail(:to => '3mle33@gmail.com', :from => '3mle33@gmail.com', :subject => '#{@subject}', :body => '#{@body}')
    Pony.mail(:to => '3mle33@gmail.com', :from => '3mle33@gmail.com', :subject => 'hi', :body => 'Hello there.')
    
  end 
  
end

 