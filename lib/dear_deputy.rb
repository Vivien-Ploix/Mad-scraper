


require 'rubygems'
require 'nokogiri'
require "httparty"
require 'open-uri'

url = "http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"
page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

list_urls = Array.new


def get_mail(deputy_url)
    page = Nokogiri::HTML(open(deputy_url))
    mail = page.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a').text
    return mail
end 

def get_urls
    page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    #first_name_list = Array.new
    #last_name_list = Array.new
    urls_list = Hash.new
    
    page.xpath('//*[@id="deputes-list"]/div/ul/li/a').each do |a|
        name = a.text
        deputy_url = "http://www2.assemblee-nationale.fr"+ a["href"]
        urls_list[a.text] = deputy_url
    end

    return urls_list
end


def get_names
    page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
    names_list = Array.new
    list_urls2 = page.xpath('//*[@id="deputes-list"]/div/ul/li/a')
    
    list_urls2.each do |link|
    names_list << link.text
    end
    return names_list
end 

def perform
    urls_list = get_urls

    result_array = Array.new 

    urls_list.each do |key, value|
        result_array << {"first_name" => key.split(' ')[1], "last_name" => key.split(' ')[2], "email" => get_mail(value)}
    end
    puts result_array

end

perform