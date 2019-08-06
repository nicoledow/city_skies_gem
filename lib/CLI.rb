require 'pry'

class CLI

#welcomes the user and launches the run method
  def start
    puts "Welcome to the CitySkies gem!"
    run
  end

#gets zipcode, then shows user the menu
  def run
    get_zipcode
    menu
  end

#gets and returns user-inputted zipcode
#should this trigger a City.new_from_scrape ?
  def get_zipcode
    puts "Please enter a 5-digit U.S. zip code to see weather or celestial information. "
    zipcode = gets.strip.to_s
    zipcode
  end

#shows menu, user selects option, returns the chosen option
  def menu
    puts "What would you like to know about your city? Please enter a number 1-6."
    puts "1. Current weather"
    puts "2. Visible planets for tonight"
    puts "3. Current moon phase"
    puts "4. Sunrise and sunset times"
    puts "5. Moonrise and moonset times"
    puts "6. Choose a new city"
    puts "7. Exit this program"
    input = gets.strip
    input
  end


#when city is chosen, need to run Scraper.scrape_city_page(zipcode)
#then need to run City.new_from_scrape based on that scrape
  def get_info

  end


end
