require_relative "./Scraper.rb"
require 'pry'
require 'nokogiri'
require 'open-uri'

class City
  attr_accessor :zipcode, :name, :current_temp, :weather_description, :weather_tomorrow, :humidity, :Mercury, :Venus, :Mars, :Jupiter, :Saturn, :Uranus, :Neptune, :daylight, :moon_brightness, :moon_phase

  @@all = []

  def initialize(weather_hash, astronomy_hash, sun_and_moon_hash)
    weather_hash.each do |k, v|
      self.send("#{k}=", v)
    end

    astronomy_hash.each do |k, v|
      self.send("#{k}=", v)
    end

    sun_and_moon_hash.each do |k, v|
      self.send("#{k}=", v)
    end
    @@all << self
  end

  def self.all
    @@all
  end


end
