require 'pry'
require_relative './Scraper.rb'
require_relative './City.rb'

class CLI
  @@zipcode = ""

  #start method that welcomes user
  def start
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
    new_city = City.new(city_weather, city_astronomical_data)

    puts "What would you like to know about #{new_city.name}? Type a number from 1-5."
    puts "1. See current weather."
    puts "2. See celestial data."
    puts "3. Exit the program."

    response = gets.to_i

    case response
    when 1
      puts new_city.current_temp
      puts new_city.weather_description
      see_more?(zipcode)
    when 2
      see_celestial_data(zipcode)
    when 3
      puts "Goodbye!"
    else
      puts "Please enter a valid command."
    end
   end

   def see_more?(zipcode)
     city = City.all.select {|city| city.zipcode == zipcode}
     binding.pry
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
CLI.new.start
