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

  def run
    puts "Please enter a 5-digit U.S. zip code to see information on that city."
    zipcode = gets.strip.to_s
    @@zipcode = zipcode

    city_weather = Scraper.scrape_weather(zipcode)
    city_astronomical_data = Scraper.scrape_astronomy(zipcode)
    new_city = City.new(city_weather, city_astronomical_data)

    puts "What would you like to know about #{new_city.name}? Type a number from 1-3."
    puts "1. See current weather."
    puts "2. See celestial data."
    puts "3. Exit the program."

    response = gets.to_i

    case response
    when 1
      puts new_city.current_temp
      puts new_city.weather_description
      puts "Would you like to see more weather information? Enter a command:"
      puts "Type 'y' to see more weather information."
      puts "Type 'menu' to return to a list of options."
      puts "Type 'new' to check information on a new city."
      puts "Type 'exit' to exit the program."
      input = gets.strip.downcase
        if input == 'y'
          see_more?(zipcode)
        elsif input == 'menu'
          #a method that runs a menu without asking for input again
          return_to_menu(zipcode)
        elsif input == 'new'
          start
        elsif input == 'exit'
          puts "Goodbye!"
        else
          puts "Please enter a valid command."
        end
    when 2
      see_celestial_data(zipcode)
    when 3
      puts "Goodbye!"
    else
      puts "Please enter a valid command."
    end
   end

   def see_more?(zipcode)
     city = City.all.detect {|city| city.zipcode == zipcode}
     puts "Tomorrow, the weather will be #{city.weather_tomorrow}."
     #scrape more data to return here!!!
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
  def return_to_menu(zipcode)
    city = City.all.find {|city| city.zipcode == zipcode}
    puts "What would you like to know about #{city.name}? Type a number from 1-3."
    puts "1. See current weather."
    puts "2. See celestial data."
    puts "3. Exit the program."

  end

  #refactoring: should I separate out a get_zipcode method that gets input and scrapes
    #then separate run method
    #run method can be recalled for return_to_menu method



end
CLI.new.start
