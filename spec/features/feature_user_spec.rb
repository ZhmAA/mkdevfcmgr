require "rails_helper"

describe "feature check user", :type => :feature do
  
  context "user registration" do

    it "check that user create" do
      visit home_signup_path
      fill_in "Email", with: "reg@name.com"
      fill_in "Password", with: "12345"
      fill_in "Password confirmation", with: "12345"
      click_button "Create User"
      expect(page).to have_content (I18n.t :welcome)
    end
  end

  context "user login/edit/logout" do

    let!(:user) { create(:user, email: "second@name.com", password: "123456789") }

    before(:each) do
      visit home_login_path
      fill_in "Email", with: "second@name.com"
      fill_in "Password", with: "123456789"
      click_button (I18n.t :enter)
    end

    it "check that user create" do
      expect(page).to have_content (I18n.t :success_enter)
    end

    it "check that user logout succesful" do
      click_link (I18n.t :exit)
      expect(current_path).to eq home_login_path
    end

    it "check that user edit succesful" do
      click_link (I18n.t :redact)
      fill_in "Email", with: "edit@name.com"
      fill_in "Password", with: "12345"
      fill_in "Password confirmation", with: "12345"
      click_button "Update User"
      expect(page).to have_content (I18n.t :red_user)
    end
  end

  context "if user not logged in" do

    it "he can't create card" do
      visit root_path
      expect(page).to have_content (I18n.t :welcome)
    end
    
  end
end