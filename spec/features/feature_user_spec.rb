require "rails_helper"

describe "feature check user", :type => :feature do
  
  context "user registration" do

  	before(:each) do
      #@user = create(:user)
      #visit root_path
    end

    it "check that user create" do
      visit "/signup"
      fill_in "Email", with: "name@name.com"
      fill_in "Password", with: "12345"
      fill_in "Password confirmation", with: "12345"
      click_button "Create User"
      expect(page).to have_content "Добро пожаловать!"
    end

    it "" do
    
    end
  end

  context "user login" do

  	before(:each) do
      @user = create(:user)
      #visit root_path
    end

    it "check that user create" do
      visit "/login"
      fill_in "Email", with: "name@name.com"
      fill_in "Password", with: "12345"
      click_button "Войти"
      expect(page).to have_content "Вход прошел успешно"
    end

    it "" do
    
    end
  end

end