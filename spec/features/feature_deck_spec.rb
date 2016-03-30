require "rails_helper"

describe "feature check decks", :type => :feature do

  let!(:user) { create(:user, email: "first@name.com", password: "123456789") }

  before(:each) do
    login("first@name.com", "123456789")
    visit root_path
  end

  it "feature test, check that you can't create card if you havn't decks" do
    click_button "Добавить карточку"
    expect(page).to have_content "У вас еще нет колод для карточек"
  end

  it "feature test, check that decks create successful" do
    click_button "Добавить колоду"
    fill_in "Deck title", with: "Test Deck"
    click_button "Create Deck"
    expect(current_path).to eq decks_path
  end

end
