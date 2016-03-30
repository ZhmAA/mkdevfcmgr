class Deck < ActiveRecord::Base
  before_save :deactivate_all_decks
  belongs_to :user
  has_many :cards

  validates :title, presence: true

  scope :current, -> { where(current: true) }
  
  private

  def deactivate_all_decks
    if self.current
      user.decks.update_all(current: false)
    end
  end

end
