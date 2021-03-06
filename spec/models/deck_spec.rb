require 'rails_helper'

RSpec.describe Deck, type: :model do
  
  let!(:user) { create(:user) }
  let(:one_of_deck) { create :deck, user: user }
  let(:one_more_deck) { create :deck, user: user }
    
  it "check that default current deck status - false" do
    expect(one_of_deck.reload.current).to be false
  end

  before(:each) do
    one_of_deck.update_attribute(:current, true)
    one_more_deck.update_attribute(:current, true)
  end

  it "check that some deck not current" do
    expect(one_of_deck.reload.current).to be false
  end

  it "check that other deck current" do
    expect(one_more_deck.current).to be true
  end

  it "check that only one deck current" do
    expect(user.decks.current.count).to eq 1
  end

end
