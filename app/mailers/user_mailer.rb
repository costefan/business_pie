class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'
 
  def welcome_email(user,ago)
  	@ago = ago
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user, subject: 'Welcome to My Awesome Site')
  end

  def give_service_notification
  	
  end
end
