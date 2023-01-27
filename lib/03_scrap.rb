require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50#pagination_deputes"))


name_array = []
page.xpath('//li[1]/h2').each do |link|
    name_array << link.text
end


email_array = []
for i in 1..name_array.length do
    page.xpath("//main/div/div/div/ul[#{i}]/li[5]/a[1]").each do |link|
        email_array << link.text
    end
end


depute_email_array = []
(name_array.length).times do |i|
    depute_mail_hash = {}
    depute_mail_hash[name_array[i]] = email_array[i]
    depute_email_array << depute_mail_hash
end

puts depute_email_array

=begin
"https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50#pagination_deputes"
"https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50&debut_deputes=50#pagination_deputes"
"https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&pagnum=50&debut_deputes=100#pagination_deputes"
=end
