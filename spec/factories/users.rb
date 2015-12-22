FactoryGirl.define do
  
  factory :user do
    sequence :email do |n|
      "name#{n}@name.com"
    end
    password "12345"
    password_confirmation { password }
  end

end
