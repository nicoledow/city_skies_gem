require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

#creates and returns a hash containing city name, zipcode, current temperature, and brief weather description
  def self.scrape_weather(zipcode)
    zipcode = zipcode.to_s
    weather_info = Nokogiri::HTML(open("https://www.timeanddate.com/weather/@z-us-#{zipcode}"))
    name = weather_info.css("head title").text.split(" ")[2].gsub(",", "")
    current_temp = weather_info.css("#bk-focus .fixed #qlook .h2").text
    weather_description = weather_info.css("#bk-focus .fixed #qlook p").first.text
    city_hash = {name: name, zipcode: zipcode, current_temp: current_temp, weather_description: weather_description}
    city_hash
  end

#gets and returns a hash with planets as keys, describing their visibility tonight
  def self.scrape_astronomy(zipcode)
    zipcode = zipcode.to_s
    astronomy_info = Nokogiri::HTML(open("https://www.timeanddate.com/astronomy/night/@z-us-#{zipcode}"))

    descriptions = []
    astronomy_info.css("p.rise_graph-desc").each do |description|
      descriptions << description.text
    end

    planet_visibility = {Mercury: descriptions[0], Venus: descriptions[1], Mars: descriptions[2], Jupiter: descriptions[3], Saturn: descriptions[4], Uranus: descriptions[5], Neptune: descriptions[6]}

  end

end
