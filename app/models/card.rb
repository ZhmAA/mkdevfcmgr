class Card < ActiveRecord::Base
  before_save :auto_date
  validates :original_text, presence: true
  validates :translated_text, presence: true
  validate :check_unique

  def auto_date
  	puts Time.current + 3.days
  end

  def check_unique
  	original_text = original_text.to_s.downcase.strip
  	translated_text = translated_text.to_s.downcase.strip
  	errors.add(:original_text, "can't be the same as translated_text") if original_text == translated_text
  end
end
