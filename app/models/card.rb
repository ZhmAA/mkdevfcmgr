class Card < ActiveRecord::Base
  require "damerau-levenshtein"
  belongs_to :user
  belongs_to :deck
  mount_uploader :avatar, AvatarUploader
  validates :original_text, :translated_text, presence: true
  validates :deck, presence: true
  validate :check_unique

  scope :random_cards, -> { where('review_date <= ?', Time.current).order('RANDOM()') }
  
  def change_date(group_num)
    case group_num
      when 0..1
        12.hour
      when 2
        3.days
      when 3
        1.week
      when 4
        2.weeks
      else
        1.month
    end
  end
  
  def bad_tries
    if try_num == 0
      update_attributes(group_num: group_num - 1, try_num: 3)
    else
      update_attributes(try_num: try_num - 1)
    end
  end
  
  def check_unique
    if original_text.downcase == translated_text.downcase
      errors.add(:original_text, "can't be the same as translated_text")
    end
  end

  def check_card(translate)
    if self.original_text == translate
      self.review_date = Time.current + change_date(group_num)
      self.update(review_date: review_date, group_num: group_num + 1, try_num: 3)
    else
      bad_tries
      false
    end
  end
  
  def levenshtein(translate)
    if levenshtein_algorithm(translate)
      self.review_date = Time.current + change_date(group_num)
      self.update(review_date: review_date, group_num: group_num + 1, try_num: 3)
    end
  end

  def levenshtein_algorithm(alt_text)
    DamerauLevenshtein.distance(original_text, alt_text) < 2
  end

end
