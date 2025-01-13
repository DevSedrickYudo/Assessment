class WeatherController < ApplicationController
  def index
  end

  def fetch_forecast
    zip_code = params[:zip_code]
    street = params[:street] rescue nil
    forecast = WeatherService.get_forecast(zip_code) # Weather API Data set up and collection can be found in this method
    
    if forecast
      @address = []
      @address << "#{street}" if street.length > 0
      if forecast['location'].present?
        @address << "#{forecast['location']['name']}"
        @address << "#{forecast['location']['region']}"
        @address << "#{zip_code}"
      end
      @address = @address.join(", ")
      if params[:temp].to_s.eql?('c')
        @current_temp = "#{forecast['current']['temp_c']} °C"
        @high_temp = "#{forecast['forecast']&.dig('forecastday', 0, 'day', 'maxtemp_c')} °C" if forecast['forecast']&.dig('forecastday', 0, 'day', 'maxtemp_c')
        @low_temp = "#{forecast['forecast']&.dig('forecastday', 0, 'day', 'mintemp_c')} °C" if forecast['forecast']&.dig('forecastday', 0, 'day', 'mintemp_c')
        @feels_like = "#{forecast['current']['feelslike_c']} °C" if forecast['current']['feelslike_c']
        @wind_chill = "#{forecast['current']['windchill_c']} °C" if forecast['current']['windchill_c']
        @heat_index = "#{forecast['current']['heatindex_c']} °C" if forecast['current']['heatindex_c']
        @dew_point = "#{forecast['current']['dewpoint_c']} °C" if forecast['current']['dewpoint_c']
      else
        @current_temp = "#{forecast['current']['temp_f']} F"
        @high_temp = "#{forecast['forecast']&.dig('forecastday', 0, 'day', 'maxtemp_f')} F" if forecast['forecast']&.dig('forecastday', 0, 'day', 'mintemp_f')
        @low_temp = "#{forecast['forecast']&.dig('forecastday', 0, 'day', 'mintemp_f')} F" if forecast['forecast']&.dig('forecastday', 0, 'day', 'mintemp_f')
        @feels_like = "#{forecast['current']['feelslike_f']} F" if forecast['current']['feelslike_f']
        @wind_chill = "#{forecast['current']['windchill_f']} F" if forecast['current']['windchill_f']
        @heat_index = "#{forecast['current']['heatindex_f']} F" if forecast['current']['heatindex_f']
        @dew_point = "#{forecast['current']['dewpoint_c']} F" if forecast['current']['dewpoint_c']
      end
       
      @is_cached = Rails.cache.exist?("forecast_#{zip_code}")
      
      flash[:error] = nil      
    else
      flash[:error] = "Could not fetch weather data. Please try again."
    end
    render :index
  end
end
