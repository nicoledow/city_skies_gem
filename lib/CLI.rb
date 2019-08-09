require 'pry'
require 'open-uri'
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

    if validate_zipcode(zipcode)
      run(zipcode)
    end
  end

  def validate_zipcode(zipcode)
    open ("https://www.timeanddate.com/weather/@z-us-#{zipcode}")
  rescue OpenURI::HTTPError
    puts "Zipcode not valid."
    get_zipcode
  else
    true
  end


  def run(zipcode)
    city = City.find_or_create_by_zipcode(zipcode)
      puts "What would you like to know about #{city.name}? Type a number from 1-3."
      puts "1. See current weather."
      puts "2. See celestial data."
      puts "3. Exit the program."

      response = gets.to_i

      case response
      when 1
        see_weather(zipcode)
      when 2
        see_celestial_data(city)
      when 3
        puts "Goodbye!"
        exit
      else
        puts "Please enter a valid command."
      end
  end

  # def run(zipcode)
  #   new_city = City.find_or_create_by_zipcode(zipcode)
  #   puts "What would you like to know about #{new_city.name}? Type a number from 1-3."
  #   puts "1. See current weather."
  #   puts "2. See celestial data."
  #   puts "3. Exit the program."
  #
  #   response = gets.to_i
  #
  #   case response
  #   when 1
  #     puts new_city.current_temp
  #     puts new_city.weather_description
  #     sleep(2)
  #     puts "Would you like to see more weather information? Enter a command:"
  #     puts "Type 'y' to see more weather information."
  #     puts "Type 'menu' to return to a list of options."
  #     puts "Type 'new' to check information on a new city."
  #     puts "Type 'exit' to exit the program."
  #     input = gets.strip.to_s.downcase
  #       if input == 'y'
  #         see_more?(zipcode)
  #       elsif input == 'menu'
  #         run(zipcode)
  #       elsif input == 'new'
  #         start
  #       elsif input == 'exit'
  #         return Goodbye!
  #       else
  #         puts "Please enter a valid command."
  #       end
  #   when 2
  #     see_celestial_data(new_city)
  #   when 3
  #     puts "Goodbye!"
  #     exit
  #   else
  #     puts "Please enter a valid command."
  #   end
  #  end

  def see_weather(zipcode)
    city = City.find_or_create_by_zipcode(zipcode)
    puts city.current_temp
        puts city.weather_description
        sleep(2)
        puts "Would you like to see more weather information? Enter a command:"
        puts "Type 'y' to see more weather information."
        puts "Type 'menu' to return to a list of options."
        puts "Type 'new' to check information on a new city."
        puts "Type 'exit' to exit the program."
        input = gets.strip.to_s.downcase
          if input == 'y'
            see_more?(zipcode)
          elsif input == 'menu'
            run(zipcode)
          elsif input == 'new'
            start
          elsif input == 'exit'
            return Goodbye!
          else
            puts "Please enter a valid command."
          end
  end



   def see_more?(zipcode)
     city = City.find_or_create_by_zipcode(zipcode)
     puts city.humidity
     puts "Tomorrow, the weather will be #{city.weather_tomorrow}."
     sleep(2)
     run(zipcode)
   end

   def see_celestial_data(city)
     puts "What celestial data would you like to see? Enter 1-3 or 'exit.'"
     puts "1. Today's daylight hours"
     puts "2. Today's moon brightness and moon phase"
     puts "3. Today's planet visibility"
     response = gets.strip.to_s.downcase

     case response
     when "1"
       puts city.daylight
       sleep(3)
       run(city.zipcode)
     when "2"
       puts "Today, the moon's illumination is at #{city.moon_brightness}."
       puts "The moon's current phase is: #{city.moon_phase}."
       sleep(3)
       run(city.zipcode)
     when "3"
       city.planet_visibility.each {|planet, visibility| puts "#{planet}: #{visibility}" unless visibility == nil}
       run(city.zipcode)
     when "exit"
       return Goodbye!
     end
   end


end
