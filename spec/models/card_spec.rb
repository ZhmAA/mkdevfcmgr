require "rails_helper"

RSpec.describe Card, :type => :model do

  let!(:user) { create(:user, email: "first@name.com", password: "123456789") }
  let(:deck) { create :deck, user: user }
  
  before(:each) do
    login("first@name.com", "123456789")
    @card = create(:card, deck: deck, user: user)
    @value = Date.current + 3.days
  end

  it "check that original and translated text not equal" do
    expect(@card.original_text).not_to eq(@card.translated_text)
  end
  
  it "check that date change after card update" do
    @card.auto_date
    expect(@card.review_date).to eq(@value)
  end
  
  it "check that when card check date change" do
    @card.check_card(@card.original_text)
    expect(@card.review_date).to eq(@value)
  end
  
  it "check that input text not equal to original text" do
    expect(@card.check_card("new ot input")).to be false
  end

  it "check that input text equal to original text" do
    expect(@card.check_card("original_text")).to be true
  end
end