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






end
