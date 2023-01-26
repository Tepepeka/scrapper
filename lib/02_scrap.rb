require 'nokogiri'
require 'open-uri'


page_all_cities = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise"))
cities_array = []
page_all_cities.xpath('//tr[3]//td[1]//p/a').each do |link|
    cities_array << link.text
    cities_array.each{|city| city.gsub!(" ","-")}
end


email_array = []
cities_array.each do |city|
    page_city = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/95/#{city.downcase}"))
    email_city = page_city.xpath('//section[2]//tr[4]//td[2]').text
    email_array << email_city
end


cities_email_array = []
(cities_array.length).times do |i|
    cities_mail_hash = {}
    cities_mail_hash[cities_array[i]] = email_array[i]
    cities_email_array << cities_mail_hash
end


p cities_email_array