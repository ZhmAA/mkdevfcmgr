class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :cards
  before_save { self.email = email.downcase }
  USER_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :uniqueness => true, :format => USER_EMAIL_REGEX
  validates :password, length: { minimum: 5 }, confirmation: true
  validates :password_confirmation, presence: true
end