require "rails_helper"

RSpec.describe Card, :type => :model do
  
  before(:each) do
    @card = create(:card)
  end

  it "check that original and translated text not equal" do
    expect(@card.original_text).not_to eq(@card.translated_text)
  end
  
  context "editor user" do
    before(:each) do
      @value = (Time.current + 3.days).to_date
    end

    it "check that date change after card update" do
      @card.auto_date
      expect(@card.review_date).to be == (@value)
    end
  
    it "check that when card check date change" do
      @card.check_card(@card.original_text)
      expect(@card.review_date).to be == (@value)
    end
  end

  it "check that input text equal to original text" do
    expect(@card.check_card("new ot input")).to be false
  end

end