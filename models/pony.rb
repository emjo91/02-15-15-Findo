class Pony
  
  def self.mail_me_something
    Pony.mail(:to => 'you@example.com', :from => 'me@example.com', :subject => 'hi', :body => 'Hello there.')
  end
  
end