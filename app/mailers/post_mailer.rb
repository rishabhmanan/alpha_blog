class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_created.subject
  #
  def post_created
    @user = params[:user]
    @article = params[:article]
    @greeting = "Hi"

    mail to: User.first.email, cc: User.all.pluck(:email), subject: "new post created"
  end
end
