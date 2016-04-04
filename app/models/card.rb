class Card < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  #before_save :auto_date
  mount_uploader :avatar, AvatarUploader
  validates :original_text, :translated_text, presence: true
  validates :deck, presence: true
  validate :check_unique

  scope :random_cards, -> { where('review_date <= ?', Time.current).order('RANDOM()') }
  
  #def auto_date
  #  unless self.new_record?
  #    self.review_date = Time.current + 3.days
  #  end
  #end
  
  def change_date(group_num)
    timenow = Time.current
    case group_num
      when 0..1
        timenow + 12.hour
      when 2
        timenow + 3.days
      when 3
        timenow + 1.week
      when 4
        timenow + 2.weeks
      else
        timenow + 1.month
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
      self.review_date = change_date(group_num)
      self.update(review_date: review_date, group_num: group_num + 1, try_num: 3)
    else
      bad_tries
      false
    end
  end

end
