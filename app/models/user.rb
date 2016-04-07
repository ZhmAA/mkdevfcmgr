class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end
  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications
  has_many :cards
  has_many :decks
  before_save { self.email = email.downcase }
  USER_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :uniqueness => true, :format => USER_EMAIL_REGEX
  validates :password, length: { minimum: 5 }, confirmation: true
  validates :password_confirmation, presence: true

  def self.mail_for_unchecked_cards
    User.joins(:cards).where('cards.review_date <= ?', Date.today).each do |user|
      UserMailer.new_cards_for_check(user).deliver_now
    end
  end

end
