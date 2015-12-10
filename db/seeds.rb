# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open("http://www.languagedaily.com/learn-german/vocabulary/most-common-german-words-2"))

doc.xpath('//table//tr[@class="rowA" or @class="rowB"]').each do |word| 
  original = word.css(".bigLetter").text
  translated = word.css("td:nth-child(3)").text
  Card.create(original_text: original, translated_text: translated, review_date: Time.current, user_id: '1')
end

