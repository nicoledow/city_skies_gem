class City
  attr_accessor :zipcode
  @@all = []

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def self.new_from_scrape(weather_hash, astronomy_hash)
    #need scraper to execute scrape and return these 2 hashes
    #use self.send to add these as attributes to object 
  end





  def self.all
    @@all
  end

end
