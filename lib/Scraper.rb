require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

  def scrape_weather(zipcode)
    weather_info = Nokogiri::HTML(open("https://www.timeanddate.com/weather/@z-us-#{zipcode}"))
    current_temp = weather_info.css("#bk-focus .fixed #qlook .h2").text
    binding.pry
  end







end

Scraper.new.scrape_weather(85259)
