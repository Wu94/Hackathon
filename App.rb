require 'accuweather'
require 'tty-prompt'
require 'kovid'
require 'terminal-table'

def get_city(city_name)
    location_array = Accuweather.city_search(name: "#{city_name}")
    city = location_array.first
end

def get_current_weather(city_name)
    city = get_city(city_name)
    current_weather = Accuweather.get_conditions(location_id: city.id, metric: true).current
    
    result = [current_weather.temperature, 
    current_weather.real_feel, current_weather.humidity, 
    current_weather.weather_text]

    puts result
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

