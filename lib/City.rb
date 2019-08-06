require_relative "./Scraper.rb"
require 'pry'
require 'nokogiri'
require 'open-uri'

class City
  attr_accessor :zipcode, :name, :current_temp, :weather_description, :Mercury, :Venus, :Mars, :Jupiter, :Saturn, :Uranus, :Neptune

  @@all = []

  def initialize(weather_hash, astronomy_hash)
    weather_hash.each do |k, v|
      self.send("#{k}=", v)
    end

    astronomy_hash.each do |k, v|
      self.send("#{k}=", v)
    end
binding.pry
    @@all << self
  end


end

City.new(Scraper.scrape_weather("85259"), Scraper.scrape_astronomy("85259"))
