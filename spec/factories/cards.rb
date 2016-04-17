FactoryGirl.define do

  factory :card do
    original_text "original_text"
    translated_text "translated_text"
    review_date Date.current
    efact 2.5
    inter 0
    user
  end

end