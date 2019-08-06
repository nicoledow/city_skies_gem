require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

#currently doesn't scrape zipcodes starting with 0+digit greater than 7
  def self.scrape_weather(zipcode)
    zipcode = zipcode.to_s
    weather_info = Nokogiri::HTML(open("https://www.timeanddate.com/weather/@z-us-#{zipcode}"))
    name = weather_info.css("head title").text.split(" ")[2].gsub(",", "")
    current_temp = weather_info.css("#bk-focus .fixed #qlook .h2").text
    weather_description = weather_info.css("#bk-focus .fixed #qlook p").first.text
    city_hash = {name: name, zipcode: zipcode, current_temp: current_temp, weather_description: weather_description}
    #binding.pry
    city_hash
  end







end

#Scraper.new.scrape_weather("85259")
