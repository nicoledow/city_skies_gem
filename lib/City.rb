class City
  attr_accessor :zipcode
  @@all = []

  def initialize(zipcode)
    @zipcode = zipcode
  end

  def self.new_from_scrape(url)

  end





  def self.all
    @@all
  end

end
