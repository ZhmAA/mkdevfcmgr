class Card < ActiveRecord::Base
  before_save :auto_date
  validates :original_text, :translated_text, presence: true
  validate :check_unique

  scope :random_card, -> { where('review_date <= ?', Time.current).order("RANDOM()").take }

  def auto_date
    unless self.new_record?
      self.review_date = Time.current + 3.days
    end
  end

  def check_unique
    if original_text.downcase == translated_text.downcase
      errors.add(:original_text, "can't be the same as translated_text")
    end
  end

  def check_card(translate)
    if self.original_text == translate
      self.review_date = Time.current + 3.days
      self.save
      return true
    end
      return false
  end

end
