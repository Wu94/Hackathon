require 'accuweather'

p location_array = Accuweather.city_search(name: 'vancouver')
p vancouver = location_array.first

p vancouver.id        # => 'cityId:53286'
p vancouver.city      # => 'Vancouver'
p vancouver.state     # => 'Canada (British Columbia)'
p vancouver.latitude  # => '49.2448'
p vancouver.longitude # => '123.1154'

p current_weather = Accuweather.get_conditions(location_id: 'cityId:53286').current
p current_weather.temperature    # => '41'
p current_weather.weather_text   # => 'Partly Sunny'
p current_weather.pressure       # => '30.35'
p current_weather.humidity       # => '43%'
p current_weather.cloud_cover    # => '40%'
  
p weather_forecast = Accuweather.get_conditions(location_id: 'cityId:53286').forecast
p last_forecast_day = weather_forecast.last
p last_forecast_day.date        # => "12/3/2015"
p last_forecast_day.day_of_week # => "Thursday"
p last_forecast_day.sunrise     # => "7:49 AM"
p last_forecast_day.sunset      # => "4:16 PM"

p weather_forecast.map(&:date)                             #  => ["11/27/2015", "11/28/2015", "11/29/2015", "11/30/2015", "12/1/2015", "12/2/2015", "12/3/2015"]
p weather_forecast.map(&:daytime).map(&:high_temperature)  # => ["45", "45", "47", "44", "44", "48", "48"]
p weather_forecast.map(&:nighttime).map(&:low_temperature) # => ["27", "28", "31", "32", "40", "42", "36"]