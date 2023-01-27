require 'nokogiri'
require 'open-uri'


def open_page(url)
    page = Nokogiri::HTML(URI.open(url))
end


def scrap_crypto_name(page)
    crypto_name_array = []
    page.xpath('//td[3]').each do |link|
        crypto_name_array << link.text
    end
    return crypto_name_array
end


def scrap_crypto_value(page)
    crypto_value_array = []
    page.xpath('//td[4]').each do |link|
        crypto_value_array << link.text
    end
    return crypto_value_array
end


def hash_into_array(arr1,arr2)
    crypto_array = []
    (arr1.length).times do |i|
        crypto_hash = {}
        crypto_hash[arr1[i]] = arr2[i]
        crypto_array << crypto_hash
    end
    return crypto_array
end


def perform
    my_page = open_page("https://coinmarketcap.com/fr/")
    arr1 = scrap_crypto_name(my_page)
    arr2 = scrap_crypto_value(my_page)
    hash_into_array(arr1, arr2)
end


puts perform