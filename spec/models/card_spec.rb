require "rails_helper"

RSpec.describe Card, :type => :model do

  let!(:user) { create(:user) }
  let(:deck) { create :deck, user: user }
  
  before(:each) do
    @card = create(:card, deck: deck, user: user)
  end

  it "check that original and translated text not equal" do
    expect(@card.original_text).not_to eq(@card.translated_text)
  end
  
  it "check that input text not equal to original text" do
    expect(@card.check_card("new ot input")).to be false
  end

  it "check that input text equal to original text" do
    expect(@card.check_card("original_text")).to be true
  end

end