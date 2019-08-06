require 'pry'

class CLI

  def get_zipcode
    puts "Please enter a 5-digit U.S. zip code to see weather or celestial information. "
    zipcode = gets.strip
    zipcode
  end

  def menu
    puts "What would you like to know about your city? Please enter a number 1-5, or 'exit' to quit."
    puts "1. Current weather"
    puts "2. Visible planets for tonight"
    puts "3. Current moon phase"
    puts "4. Sunrise and sunset times"
    puts "5. Moonrise and moonset times"
  end


#when city is chosen, need to run Scraper.scrape_city_page(zipcode)
#then need to run City.new_from_scrape based on that scrape
    def run
      puts "Hello! Welcome to the CitySkies gem."
      get_zipcode
      menu
      input = gets.strip.downcase

      case input
      when "1"

      when "2"

      when "3"

      when "4"

      when "5"

      when "exit"
        puts "Goodbye!"
        #do I need any code to officially end the program?
      else
        puts "Please enter a valid command."
      end
    end

end
