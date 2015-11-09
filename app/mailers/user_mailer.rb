class UserMailer < ApplicationMailer
	default from: 'lanevera@users.com'

	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: '¡Bienvenido a La Nevera!')
	end
end
