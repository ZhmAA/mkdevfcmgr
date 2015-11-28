FactoryGirl.define do

  factory :card do
    original_text "original_text"
    translated_text "translated_text"
    review_date Time.current
  end

end