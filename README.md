# CitySkies

Welcome to the CitySkies gem! CitySkies scrapes data from timeanddate.com and allows you to quickly and conveniently access current weather and celestial information for any U.S. city. When running the program, just enter a 5-digit zipcode and you will be able to see the current weather, sunrise and sunset times, the current moonphase, and what planets will be visible (and where) when you look into the sky tonight.

The goal of this gem is for you to be able to quickly access important data to help you plan your day, straight from your terminal. Who has time to deal with slow-loading weather apps?

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'city_skies'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install city_skies

## Usage
Upon running the program (through the lib/city_skies.rb file), you will be prompted to enter a 5 digit zipcode. Doing so will bring up a menu of options. These options include: see current weather information, see celestial information, or exit the program. 

Option 1 returns a menu that will let you see the current temperature, current humidity, and tomorrow's forecasted weather. 
Option 2 returns a new menu that will let you choose to see today's daylight hours, today's moon illumination and moon phase, and tonight's visible planets.


## Prerequisites

CitySkies requires the Nokogiri and Open-URI gems for scraping data from timeanddate.com.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'mlle_dow'/city_skies. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CitySkies project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'mlle_dow'/city_skies/blob/master/CODE_OF_CONDUCT.md).
