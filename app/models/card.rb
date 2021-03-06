class Card < ActiveRecord::Base
  require "damerau-levenshtein"
  belongs_to :user
  belongs_to :deck
  mount_uploader :avatar, AvatarUploader
  validates :original_text, :translated_text, presence: true
  validates :deck, presence: true
  validate :check_unique

  scope :random_cards, -> { where('review_date <= ?', Time.current).order('RANDOM()') }
  
  def check_unique
    if original_text.downcase == translated_text.downcase
      errors.add(:original_text, "can't be the same as translated_text")
    end
  end
  
  def card_success_update
    new_upd = Supermemo.memo(efact, sec, inter)
    update(new_upd)
  end

  def check_card(translate)
    if self.original_text == translate
      card_success_update
    else
      false
    end
  end
  
  def levenshtein(translate)
    if levenshtein_algorithm(translate)
      card_success_update
    end
  end

  def levenshtein_algorithm(alt_text)
    DamerauLevenshtein.distance(original_text, alt_text) < 2
  end

end
