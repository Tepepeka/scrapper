require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50#pagination_deputes"))

name_array = []
page.xpath('//ul//h2').each do |link|
    puts link.text
end


email_array = []
page.xpath('//li[5]/a').each do |link|
    puts link.text
end