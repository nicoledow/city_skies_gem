require_relative "./Scraper.rb"
require 'pry'
require 'nokogiri'
require 'open-uri'

class City
  attr_accessor :zipcode, :name, :current_temp, :weather_description

  @@all = []

  def initialize(weather_hash, #astronomy_hash)
    weather_hash.each do |k, v|
      self.send("#{k}=", v)
    end
    astronomy_hash.each do |k, v|
      self.send("#{k}=", v)
    end
    @@all << self
  end




  def self.all
    @@all
  end

end

City.new(Scraper.scrape_weather("85259"))
