require 'pry'

class CLI

  #start method that welcomes user
  def self.start
    puts "Hi! Welcome to the CitySkies gem."
    get_zipcode
  end

  #ask for user to input zipcode
  def self.get_zipcode
    puts "Please enter a 5-digit U.S. zip code to see information on that city."
    zipcode = gets.strip.to_s
    binding.pry
    zipcode
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
