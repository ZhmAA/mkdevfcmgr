require "rails_helper"

RSpec.describe Card, :type => :model do

  let!(:user) { create(:user) }
  let(:deck) { create :deck, user: user }
  
  before(:each) do
    login("first@name.com", "123456789")
    @card = create(:card, deck: deck, user: user)
    @valueone = (Time.current + 12.hour).strftime("%Y-%m-%d %H:%M:%S")
    @valuetwo = (Time.current + 1.week).strftime("%Y-%m-%d %H:%M:%S")
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

  context "check group switch" do
    
    it "check group after first check" do
      @card.check_card("original_text")
      expect(@card.group_num).to eq 1
    end

    it "check switching group" do
      @card.group_num = 2
      @card.check_card("original_text")
      expect(@card.group_num).to eq 3
    end

    it "rewiev date change after swithing group" do
      @card.check_card("original_text")
      expect((@card.review_date).strftime("%Y-%m-%d %H:%M:%S")).to eq(@valueone)
    end

    it "rewiev date change after swithing group third time" do
      @card.group_num = 3
      @card.check_card("original_text")
      expect((@card.review_date).strftime("%Y-%m-%d %H:%M:%S")).to eq(@valuetwo)
    end
  end

  context "check limit tries" do
    
    it "check that try down if check false" do
      @card.check_card("new ot input")
      expect(@card.try_num).to eq 2
    end

    before(:each) do
      @card.group_num = 4
      @card.try_num = 0
      @card.check_card("new ot input")
    end

    it "check what happens with group number when try eq 0" do
      expect(@card.group_num).to eq 3
    end

    it "check what happens with try number when try eq 0" do
      expect(@card.try_num).to eq 3
    end

  end
end