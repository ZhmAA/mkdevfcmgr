class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :cards

  validates :title, presence: true

  scope :current, -> { where(current: true) }
  
  before_save :deactivate_all_decks
    
  #def is_active?
  #  return self.reload.current if self.persisted?
  #  false
  #end

  private

  def deactivate_all_decks
    if self.current
      user.decks.update_all(current: false)
    end
  end

end
