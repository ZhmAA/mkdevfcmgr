# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/new_cards_for_check
  def new_cards_for_check
    UserMailer.new_cards_for_check
  end

end
