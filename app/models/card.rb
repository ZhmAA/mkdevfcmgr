class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  before_save :auto_date
  mount_uploader :avatar, AvatarUploader
  validates :original_text, :translated_text, presence: true
  validates :deck, presence: true
  validate :check_unique

  scope :random_cards, -> { where('review_date <= ?', Time.current).order('RANDOM()') }

  def auto_date
    unless self.new_record?
      self.review_date = Date.current + 3.days
    end
  end

  def check_unique
    if original_text.downcase == translated_text.downcase
      errors.add(:original_text, "can't be the same as translated_text")
    end
  end

  def check_card(translate)
    if self.original_text == translate
      self.review_date = Date.current + 3.days
      self.save
    else 
      false
    end
  end
end
