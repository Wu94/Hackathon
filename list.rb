require 'accuweather'
require 'tty-prompt'
require 'kovid'
require 'terminal-table'
require_relative 'hack_table'

# def weather()
# prompt = TTY::Prompt.new
# choice = prompt.select("What would you like to do", %w(Humidity Latidude Weather Temperature Sunrise Sunset CloudCover MaxTemp))
#     if choice == "Humidity"
#     elsif choice == "Latidude"
#     elsif choice == "Weather"
#     elsif choice == "Temperature"
#     elsif choice == "Sunrise"
#     elsif choice == "Sunset"
#     elsif choice == "CloudCover"
#     elsif choice == "MaxTemp"
#     end
# end


def get_city(city_name)
    location_array = Accuweather.city_search(name: "#{city_name}")
    city = location_array.first
end

def get_weather_forcast(city_name)

    city = get_city(city_name)
    weather_forecast = Accuweather.get_conditions(location_id: city.id, metric: true).forecast
    day_1 = weather_forecast[0]
    # daytime 
    day_1_daytime = day_1.daytime.weather_text_long
    day_1_day_max = day_1.daytime.high_temperature
    day_1_day_min = day_1.daytime.low_temperature

    # nighttime
    day_1_nighttime = day_1.nighttime.weather_text_long
    day_1_night_max = day_1.nighttime.high_temperature
    day_1_night_min = day_1.nighttime.low_temperature

end

def start()
prompt = TTY::Prompt.new
start_choice = prompt.select("What would you like to do", %w(CovidStatsAus Current Forecast))
    if start_choice == "CovidStatsAus"
       return system("kovid check Australia")
    elsif start_choice == "Current"
        get_current_weather("Sydney")
    elsif start_choice == "Forecast"
        get_weather_forcast("Sydney")
    end
end
puts "Welcome to the Sydney isolation helper!"
start()



#     daytimeWeather dayMaxtemp dayMintemp  NighttimeWeather NightMax NightMin

# Temperature, Real Feel, Humidity, Weather Description

def letter_score()

    system("clear")
    
    table = Terminal::Table.new :title => "LETTER SCORING TABLE", :headings => ["LETTERS", "POINTS"] do |t|
    t << ["A, E, I, O, U, L, N, R, S, T", 1]
    t << :separator
    t.add_row ["D, G", 2]
    t.add_separator
    t.add_row ["B, C, M, P", 3]
    t.add_separator
    t.add_row  ["F, H, V, W, Y", 4]
    t.add_separator
    t.add_row ["K", 5]
    t.add_separator
    t.add_row ["J, X", 8]
    t.add_separator
    t.add_row ["Q, Z", 10]
    end

    puts table
    return_menu()
end