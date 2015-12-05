require "rails_helper"

describe "feature check card", :type => :feature do
  
  before(:each) do
    @card = create(:card)
    visit root_path
  end

  it "feature test, check that card check" do
    fill_in :translate, with: "original_text"
    click_button "Проверить"
    expect(current_path).to eq root_path
  end

  it "feature test, check that card check failed" do
    fill_in :translate, with: "wrong ot"
    click_button "Проверить"
    expect(page).to have_content "Не правильно"
  end
end