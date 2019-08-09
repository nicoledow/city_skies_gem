class City
  attr_accessor :zipcode, :name, :current_temp, :weather_description, :weather_tomorrow, :humidity, :Mercury, :Venus, :Mars, :Jupiter, :Saturn, :Uranus, :Neptune, :daylight, :moon_brightness, :moon_phase, :planet_visibility

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
    @planet_visibility = astronomy_hash
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_zipcode(zipcode)
    self.all.detect {|city| city.zipcode == zipcode}
  end

  def self.find_or_create_by_zipcode(zipcode)
    if self.find_by_zipcode(zipcode)
      self.find_by_zipcode(zipcode)
    else
      weather = Scraper.scrape_weather(zipcode)
      astronomy = Scraper.scrape_astronomy(zipcode)
      sun_and_moon = Scraper.scrape_sun_and_moon(zipcode)
      self.new(weather, astronomy, sun_and_moon)
    end
  end

end
