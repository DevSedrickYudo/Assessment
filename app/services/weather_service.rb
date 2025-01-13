require 'httparty'

class WeatherService
  BASE_URL = "https://api.weatherapi.com/v1/current.json".freeze

  def self.get_forecast(zip_code)
    # Need to make sure proper forecast data from the Weather API is retrieved. S.Y Jan 10 2025
    Rails.logger.info "Fetching weather for ZIP code: #{zip_code}" 
    
    # Weather API (https://www.weatherapi.com/docs/) uses zipcode to retrive forecast data
    Rails.cache.fetch("forecast_#{zip_code}", expires_in: 30.minutes) do
      api_key = ENV['ADD_TEMP_API_KEY']
      url = "#{BASE_URL}?key=#{api_key}&q=#{zip_code}"
      
      # Need to make sure proper URL is routed. S.Y Jan 10 2025
      Rails.logger.info "API URL: #{url}"

      response = HTTParty.get(url)
      if response.success?
        # Viewing API Data in log. S.Y Jan 10 2025
        Rails.logger.info "API Response: #{response.body}"
        return JSON.parse(response.body)
      else
        Rails.logger.error "API Error: #{response.body}"
        nil
      end
    end
  end
end
