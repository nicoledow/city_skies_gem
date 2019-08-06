require 'pry'

class CLI

  def begin
    puts "Hello! Welcome to the CitySkies gem."
  end

  def get_zipcode
    puts "Please enter a 5-digit U.S. zip code to see weather or celestial information. "
    zipcode = gets.strip
    zipcode
  end

  def menu
    puts "What would you like to know about your city? Please enter a number 1-5."
    puts "1. Current weather"
    puts "2. Visible planets for tonight"
    puts "3. Current moon phase"
    puts "4. Sunrise and sunset times"
    puts "5. Moonrise and moonset times"
    #puts "6. All yearly meteor showers"
  end




end
