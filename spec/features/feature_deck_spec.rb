require "rails_helper"

describe "feature check decks", :type => :feature do

  let!(:user) { create(:user, email: "first@name.com", password: "123456789") }

  before(:each) do
    visit home_login_path
    fill_in "Email", with: "first@name.com"
    fill_in "Password", with: "123456789"
    click_button (I18n.t :enter)
    visit root_path
  end

  it "feature test, check that you can't create card if you havn't decks" do
    click_link (I18n.t :add_cards)
    expect(page).to have_content (I18n.t :no_decks)
  end

  it "feature test, check that decks create successful" do
    click_link (I18n.t :add_decks)
    fill_in "Deck title", with: "Test Deck"
    click_button "Create Deck"
    expect(current_path).to eq dashboard_decks_path
  end

end
