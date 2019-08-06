require 'pry'

class CLI
  @@zipcode = ""

  #start method that welcomes user
  def self.start
    puts "Hi! Welcome to the CitySkies gem."
    run
  end

  #ask for user to input zipcode
  # def get_zipcode
  #   puts "Please enter a 5-digit U.S. zip code to see information on that city."
  #   zipcode = gets.strip.to_s
  #   zipcode
  # end

  def run
    puts "Please enter a 5-digit U.S. zip code to see information on that city."
    zipcode = gets.strip.to_s
    @@zipcode = zipcode

    city_weather = Scraper.scrape_weather(zipcode)
    city_astronomical_data = Scraper.scrape_astronomy(zipcode)
    city = City.new(city_weather, city_astronomical_data)




  end

  #scrape data using zipcode as argument
  #instantiate a new City object using scraped data

  #provide menu of options
    #see current weather
      #would you like to see additional weather details?
    #see astronomical data
      #sunrise/sunset
      #moonrise/moonset
      #visible planets tonight
    #exit the program
      #print goodbye message



end
CLI.get_zipcode
