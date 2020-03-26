require 'accuweather'
require 'tty-prompt'

prompt = TTY::Prompt.new
user_input = prompt.select "Lookup", ["weather"]

def weather
    if user_input == "weather"
        prompt.select("What would you like to do", 
        %w(Humidity Latidude Weather Temperature 
        Sunrise Sunset CloudCover MaxTemp))
    end
end
