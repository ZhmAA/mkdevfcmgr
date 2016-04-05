FactoryGirl.define do

  factory :card do
    original_text "original_text"
    translated_text "translated_text"
    review_date Date.current
    group_num 0
    try_num 3
    user
  end

end