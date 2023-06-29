class UserMailer < ApplicationMailer
default from: 'trackletteam@gmail.com'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Glad to have You on Our Site')
  end
end
