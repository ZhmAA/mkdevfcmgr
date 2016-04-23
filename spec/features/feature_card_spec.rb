require "rails_helper"

describe "feature check card", :type => :feature do
  
  let!(:user) { create(:user, email: "first@name.com", password: "123456789") }
  let(:deck) { create :deck, user: user }

  before(:each) do
    visit home_login_path
    fill_in "Email", with: "first@name.com"
    fill_in "Password", with: "123456789"
    click_button (I18n.t :enter)
    @card = create(:card, deck: deck, user: user)
    visit root_path
  end

  it "feature test, check that card check" do
    fill_in :translate, with: "original_text"
    click_button (I18n.t :check_button)
    expect(current_path).to eq root_path
  end

  it "feature test, check that card check failed" do
    fill_in :translate, with: "wrong ot"
    click_button (I18n.t :check_button)
    expect(page).to have_content "Не правильно"
  end
end