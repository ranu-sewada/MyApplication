class UserMailer < ApplicationMailer
  default from: 'ranu.ongraph@example.com'
	def welcome_email(user)
    @user = user

    mail(to: @user.email, subject: 'You have successfully applied for this job', :body =>"this is the body")
  end
end
