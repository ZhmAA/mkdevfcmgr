require "rails_helper"

describe "feature check user", :type => :feature do
  
  context "user registration" do

    it "check that user create" do
      visit signup_path
      fill_in "Email", with: "reg@name.com"
      fill_in "Password", with: "12345"
      fill_in "Password confirmation", with: "12345"
      click_button "Create User"
      expect(page).to have_content "Добро пожаловать!"
    end
  end

  context "user login/edit/logout" do

    let!(:user) { create(:user, email: "second@name.com", password: "123456789") }

    before(:each) do
      login("second@name.com", "123456789")
    end

    it "check that user create" do
      expect(page).to have_content "Вход прошел успешно"
    end

    it "check that user logout succesful" do
      click_link "Выйти"
      expect(page).to have_content "Вы вышли из аккаунта!"
    end

    it "check that user edit succesful" do
      click_link "Редактировать"
      fill_in "Email", with: "edit@name.com"
      fill_in "Password", with: "12345"
      fill_in "Password confirmation", with: "12345"
      click_button "Update User"
      expect(page).to have_content "Профиль отредактирован успешно!"
    end
  end

  context "if user not logged in" do

    it "he can't create card" do
      visit root_path
      click_button "Добавить карточку"
      expect(page).to have_content "Введите свои данные для того чтобы зайти!"
    end
    
  end
end