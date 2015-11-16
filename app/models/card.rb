class Card < ActiveRecord::Base
  before_save :auto_date
  validates :original_text, :translated_text, presence: true
  validate :check_unique

  def auto_date
    unless self.new_record? 
      self.review_date = Time.current + 3.days
    end
  end

  def check_unique
    if original_text.downcase == translated_text.downcase
      даerrors.add(:original_text, "can't be the same as translated_text")
    end
  end
end
