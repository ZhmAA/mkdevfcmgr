require 'rails_helper'

RSpec.describe Deck, type: :model do
  
  let!(:user) { create(:user, email: "first@name.com", password: "123456789") }
  let(:deck) { create :deck, user: user }
  
  before(:each) do
    login("first@name.com", "123456789")
  end

  it "only one deck - current" do
    create(:deck, title: 'firstdeck', user: user)
    create(:deck, title: 'seconddeck', user: user)
    user.decks.first.update_attribute(:current, true)
    user.decks.second.update_attribute(:current, true)
    expect(user.decks.current.count).to eq 1
  end

end
