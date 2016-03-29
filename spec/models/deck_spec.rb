require 'rails_helper'

RSpec.describe Deck, type: :model do
  
  let!(:user) { create(:user, email: "first@name.com", password: "123456789", id: '1') }

  before(:each) do
    login("first@name.com", "123456789")
  end

  it "only one deck - current" do
  	deck1 = create(:deck, user: user)
    deck2 = create(:deck, user: user)
    deck1.update_attribute(:current, true)
    deck2.update_attribute(:current, true)
    expect(user.decks.current.count).to eq 1
  end

end
