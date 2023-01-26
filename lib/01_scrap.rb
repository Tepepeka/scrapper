require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/fr/"))


crypto_name_array = []
page.xpath('//td[3]').each do |link|
    crypto_name_array << link.text
end
  

crypto_value_array = []
page.xpath('//td[4]').each do |link|
    crypto_value_array << link.text
end        


crypto_array = []
(crypto_name_array.length).times do |i|
    crypto_hash = {}
    crypto_hash[crypto_name_array[i]] = crypto_value_array[i]
    crypto_array << crypto_hash
end


puts crypto_array