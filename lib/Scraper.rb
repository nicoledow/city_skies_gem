require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

  def scrape_weather(zipcode)
    weather_info = Nokogiri::HTML(open("https://www.timeanddate.com/weather/@z-us-#{zipcode}"))
    binding.pry
  end







end

Scraper.new.scrape_weather(85259)
