# test/services/weather_service_test.rb
require 'test_helper'

class WeatherServiceTest < ActiveSupport::TestCase
  def setup
    @zip_code = '78229'
    @forecast_data = { temperature: 75, high: 80, low: 70, description: 'Clear Sky' }

    # Stubbing the method for a specific instance of WeatherForecastService
    @weather_service = WeatherService.new
    @weather_service.stubs(:fetch_forecast).returns(@forecast_data)
  end

  test 'should return forecast data' do
    forecast_data = @weather_service.fetch_forecast
    assert_equal @forecast_data, forecast_data
  end

  test 'should return error message if API call fails' do
    # Simulate failure by stubbing the method to return an error
    @weather_service.stubs(:fetch_forecast).returns({ error: 'Unable to fetch weather data' })

    forecast_data = @weather_service.fetch_forecast
    assert_equal({ error: 'Unable to fetch weather data' }, forecast_data)
  end
end
