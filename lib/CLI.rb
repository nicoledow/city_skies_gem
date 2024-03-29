require 'pry'
require 'open-uri'
require 'colorize'
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
    puts "Zipcode not valid.".bold.colorize(:red)
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
        puts "Goodbye!".bold.colorize(:green)
        exit
      else
        puts "Please enter a valid command.".bold.colorize(:red)
      end
  end


  def see_weather(zipcode)
    city = City.find_or_create_by_zipcode(zipcode)
    puts city.current_temp.bold.colorize(:light_blue)
    puts city.weather_description.bold.colorize(:light_blue)
    second_weather_menu(zipcode)
  end


  def second_weather_menu(zipcode)
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
        puts "Goodbye!".bold.colorize(:green)
        exit
      else
        puts "Please enter a valid command.".bold.colorize(:red)
        second_weather_menu(zipcode)
      end
  end


   def see_more?(zipcode)
     city = City.find_or_create_by_zipcode(zipcode)
     puts city.humidity.bold.colorize(:light_blue)
     puts "Tomorrow, the weather will be #{city.weather_tomorrow}.".bold.colorize(:light_blue)
     sleep(3)
     run(zipcode)
   end


   def see_celestial_data(city)
     puts "What celestial data would you like to see? Enter 1-5."
     puts "1. Today's daylight hours"
     puts "2. Today's moon brightness and moon phase"
     puts "3. Today's planet visibility"
     puts "4. Return to main menu"
     puts "5. Learn about a new city"
     puts "6. Exit the program"
      response = gets.strip.to_i

    case response
    when 1
      puts city.daylight.bold.colorize(:light_blue)
      sleep(3)
      return_to_celestial_menu(city)
    when 2
      see_moon_data(city)
      sleep(3)
      return_to_celestial_menu(city)
    when 3
      show_planet_visibility(city)
      sleep(3)
      return_to_celestial_menu(city)
    when 4
      run(city.zipcode)
    when 5
      self.start
    when 6
      puts "Goodbye!".bold.colorize(:green)
      exit
    else
      puts "Please enter a valid command.".bold.colorize(:red)
    end

   end


   def return_to_celestial_menu(city)
     see_celestial_data(city)
   end


   def show_planet_visibility(city)
    city.planet_visibility.each {|planet, visibility| puts "#{planet}: #{visibility}".bold.colorize(:light_blue) unless visibility == nil}
   end


   def see_moon_data(city)
     puts "Today, the moon's illumination is at #{city.moon_brightness}.".bold.colorize(:light_blue)
     puts "The moon's current phase is: #{city.moon_phase}.".bold.colorize(:light_blue)
   end

end
