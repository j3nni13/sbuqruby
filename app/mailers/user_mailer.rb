class UserMailer < ApplicationMailer
	default from: "spacebuq@gmail.com"

	def welcome_email(user)
		@user = user
		@url = 'http://spacebuq.com'
		mail(to: @user.email, subject: "Test Welcome Email")
	end
end
