require 'rubygems'
require 'nokogiri'
require "httparty"
require 'open-uri'


def get_cryptocurrencies

    url = "https://coinmarketcap.com/all/views/all/"
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) 

    cryptocurrencies_name_list = page.xpath('//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[3]/div')
    cryptocurrencies_price_list = page.xpath('//*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/a')

    names_array = Array.new
    prices_array = Array.new

    cryptocurrencies_name_list.each do |crypto|
        names_array << crypto.text
    end 

    cryptocurrencies_price_list.each do |price|
        prices_array << price.text.gsub(/[$,]/,'').to_f
    end
    
    hash= Hash[names_array.zip(prices_array)]

    array_of_hashes = Array.new
    hash.each_slice(1).map{|e| e.to_h}.each do |couple|
        array_of_hashes << couple
    end
    return array_of_hashes
end

get_cryptocurrencies















