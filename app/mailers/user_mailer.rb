class UserMailer < ActionMailer::Base
  default from: "uwharrie-offroad.com"
  def password_reset(user)
    @user = user
    @new_password = SecureRandom.hex(10)
    @user.update_attributes(:password => @new_password, :password_confirmation => @newpassword)
    mail(:to => user.email, :subject => "Password Reset")
  end
end
