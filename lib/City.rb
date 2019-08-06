require_relative "./Scraper.rb"
require 'pry'
require 'nokogiri'
require 'open-uri'

class City
  attr_accessor :zipcode, :name, :current_temp, :weather_description

  @@all = []

  def initialize(weather_hash)
    weather_hash.each do |k, v|
      self.send("#{k}=", v)
      binding.pry
    end
    @@all << self
  end

  # def self.new_from_scrape(zipcode)
  #   #need scraper to execute scrape and return these 2 hashes
  #   #use self.send to add these as attributes to object
  #   weather_hash = Scraper.scrape_weather(zipcode)
  #   #astronomy_hash = Scraper.scrape_astronomy(zipcode)
  #
  #   weather_hash.each do |k, v|
  #     self.send("#{k}=", v)
  #   end
  #   binding.pry
  # end





  def self.all
    @@all
  end

end

City.new(Scraper.scrape_weather("85259"))
