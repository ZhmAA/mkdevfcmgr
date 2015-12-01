FactoryGirl.define do

  factory :card do
  	id "100"
    original_text "original_text"
    translated_text "translated_text"
    review_date Date.current
  end

end