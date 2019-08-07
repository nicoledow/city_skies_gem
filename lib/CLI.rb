require 'pry'
require_relative './Scraper.rb'
require_relative './City.rb'

class CLI

  def start
    puts "Hi! Welcome to the CitySkies gem."
    get_zipcode
  end


  def get_zipcode
    puts "Please enter a 5-digit U.S. zip code to see information on that city."
    zipcode = gets.strip.to_s

    if zipcode.length != 5
      puts "Please enter a valid zipcode."
      zipcode = gets.strip.to_s
    end

    city_weather = Scraper.scrape_weather(zipcode)
    city_astronomical_data = Scraper.scrape_astronomy(zipcode)
    city_sun_moon_data = Scraper.scrape_sun_and_moon(zipcode)
    new_city = City.new(city_weather, city_astronomical_data, city_sun_moon_data)
    run(zipcode)
  end


  def run(zipcode)
    new_city = find_by_zipcode(zipcode)
    puts "What would you like to know about #{new_city.name}? Type a number from 1-3."
    puts "1. See current weather."
    puts "2. See celestial data."
    puts "3. Exit the program."

    response = gets.to_i

    case response
    when 1
      puts new_city.current_temp
      puts new_city.weather_description
      sleep(3)
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
          return Goodbye!
        else
          puts "Please enter a valid command."
        end
    when 2
      see_celestial_data(zipcode)
    when 3
      return Goodbye!
    else
      puts "Please enter a valid command."
    end
   end



   def see_more?(zipcode)
     city = City.all.detect {|city| city.zipcode == zipcode}
     puts city.humidity
     puts "Tomorrow, the weather will be #{city.weather_tomorrow}."
     sleep(3)
     run(zipcode)
   end



 def find_by_zipcode(zipcode)
   City.all.find {|city| city.zipcode == zipcode}
 end


end
