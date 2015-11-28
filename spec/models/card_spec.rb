require "rails_helper"

RSpec.describe Card, :type => :model do
  
  before(:each) do
    card1 = create(:card)
    card = card1.update(original_text: "change")
  end

  it "check that original and translated text not equal" do
    expect(:original_text).not_to eq(:translated_text)
  end

  it "check that date change after card update" do
    expect(:review_date).to eq(Time.current + 3.days)
  end

  it "check that input text nust be equal original text" do
    expect(card.check_card("another text")).to be false
  end

end