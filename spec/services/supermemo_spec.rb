require "rails_helper"

describe Supermemo do
  
  let!(:user) { create(:user) }
  let(:deck) { create :deck, user: user }

  before(:each) do
    login("first@name.com", "123456789")
    @card = create(:card, deck: deck, user: user, efact: 2.5, inter: 0)
    @valueone = (Time.current + 1.day).strftime("%Y-%m-%d")
    @valuetwo = (Time.current + 6.day).strftime("%Y-%m-%d")
  end

  context "check e-factor" do
    it "if e-factor lower than 1.3" do
      expect(Supermemo.e_factor(1.5, 1)).to eq 1.3
    end

    it "calculate new e-factor if qual 5" do
      expect(Supermemo.e_factor(2.5, 5)).to eq 2.6
    end
  end

  context "check intervals" do
    it "when interval change to 1 reviewdate + 1 day" do
      @card.inter = 0
      @card.check_card("original_text")
      expect((@card.review_date).strftime("%Y-%m-%d")).to eq(@valueone)
    end

    it "when interval change to 2 - reviewdate + 6 day" do
      @card.inter = 1
      @card.check_card("original_text")
      expect((@card.review_date).strftime("%Y-%m-%d")).to eq(@valuetwo)
    end 

    it "when interval > 2" do
      expect(Supermemo.interval(2.5, 4)).to eq 7.5
    end
  end

  context "check evaluation" do
    it "if evaluation low inter => 0" do
      expect(Supermemo.evaluation(2, 0)).to eq 0
    end

    it "if evaluation high inter + 1" do
      expect(Supermemo.interval(5, 1)).to eq 1.day
    end
  end

  context "check timer" do
    it "qual 5 when check card faster than 15 seconds" do
      expect(Supermemo.time_sec(10)).to eq 5
    end

    it "qual 4 when check card faster than 30 seconds" do
      expect(Supermemo.time_sec(22)).to eq 4
    end

    it "qual 3 when check card after 30 seconds" do
      expect(Supermemo.time_sec(47)).to eq 3
    end
  end

end