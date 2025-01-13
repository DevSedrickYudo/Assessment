# README

# Forecast From Address Application

## Description
This is a Ruby on Rails application to fetch and display forecast data for specified address using the WeatherAPI. See Documentation.txt for all importatn files used in this application

---


# Weather Forecast App

## Features
- Fetches real-time weather data from WeatherAPI.
- Caches results to minimize API usage and improve performance.
- Unit tests for controllers to ensure reliability.
- Detailed comments and decomposition for maintainability.

## Setup
1. Clone the repository. You can do this with the command git clone https://github.com/DevSedrickYudo/Assessment.git
2. Run `bundle install`.
3. Add .env file to your root for the project 
4. `ADD_TEMP_API_KEY=f5d052276cb5472d86b33812251301` in your `.env` file. (only available 14 days from Jan 13th)
5. Run `rails s` and visit `http://localhost:3000`.

## Scalability
- Leveraged caching to handle high traffic.
- Separated business logic into a service object (`WeatherService`).

## Design Patterns
- Service Object: Encapsulates API interaction logic.
- Work to save Address and Forecast information was done too, but for now lets just view the data
```

---

# Assessments
# Assessment
