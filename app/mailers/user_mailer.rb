class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_cards_for_check.subject
  #
  def new_cards_for_check(user)
    @user = user

    mail to: @user.email, suject: "New cards are ready for check"
  end
end
