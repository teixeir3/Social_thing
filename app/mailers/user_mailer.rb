class UserMailer < ActionMailer::Base
  default from: "admin@SocialThing.com"

  def reset_password_email(user)
    @user = user
    @email_token = user.reset_email_token!
    @reset_url = "http://localhost:3000/users/reset_password?email_token=#{@email_token}&id=#{@user.id}"
    mail(to: user.email, subject: "Reset Password")
  end
end
