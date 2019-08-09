
require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

#creates and returns a hash containing city name, zipcode, current temperature, and brief weather description
  def self.scrape_weather(zipcode)
    zipcode = zipcode.to_s
    weather_info = Nokogiri::HTML(open("https://www.timeanddate.com/weather/@z-us-#{zipcode}"))

    city_hash = {
      name: weather_info.css("head title").text.split(" ")[2..-1].join(" "),
      current_temp: weather_info.css("#bk-focus .fixed #qlook .h2").text,
      weather_description: weather_info.css("#bk-focus .fixed #qlook p").first.text,
      weather_tomorrow: weather_info.css("#wt-48 tbody .c1 td")[3].text,
      humidity: weather_info.css("#qfacts p")[5].text
    }
  end


#gets and returns a hash with planets as keys, describing their visibility tonight
  def self.scrape_astronomy(zipcode)
    zipcode = zipcode.to_s
    astronomy_info = Nokogiri::HTML(open("https://www.timeanddate.com/astronomy/night/@z-us-#{zipcode}"))

    descriptions = []
    astronomy_info.css("p.rise_graph-desc").each {|description| descriptions << description.text}

    planet_visibility = {
      Mercury: descriptions[0],
      Venus: descriptions[1],
      Mars: descriptions[2],
      Jupiter: descriptions[3],
      Saturn: descriptions[4],
      Uranus: descriptions[5],
      Neptune: descriptions[6]
    }
  end


  def self.scrape_sun_and_moon(zipcode)
    zipcode = zipcode.to_s

    sun_data = Nokogiri::HTML(open("https://www.timeanddate.com/sun/@z-us-#{zipcode}"))
    moon_data = Nokogiri::HTML(open("https://www.timeanddate.com/moon/@z-us-#{zipcode}"))

    sun_and_moon_hash = {
      daylight: sun_data.css("#bk-focus .fixed #qlook p.dn-mob").text.gsub("pm1", "pm: 1"),
      moon_brightness: moon_data.css("#cur-moon-percent").text,
      moon_phase: moon_data.css("#qlook p").text
    }
  end

end
