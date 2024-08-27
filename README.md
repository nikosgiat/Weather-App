
# WeatherApp - Flutter Weather App

## Overview

WeatherApp is a simple and intuitive Flutter application that provides real-time weather forecasts. The app fetches weather data from the OpenWeatherMap API and displays forecasts for the next 24 hours in 3-hour intervals. With a clean and responsive UI, the app ensures a seamless experience across different screen sizes. 

## Key Features

### 1. **Responsive UI with ScreenUtil**
   - Utilizes the `ScreenUtil` package to ensure responsive design across various devices.
   - Dynamically adjusts text, padding, and margins based on screen size to maintain a consistent UI/UX.

### 2. **HTTP Requests to OpenWeatherMap API**
   - Makes HTTP requests to fetch real-time weather data from the OpenWeatherMap API.
   - Retrieves weather data for the next 24 hours with 3-hour intervals, including temperature, humidity, wind speed, and more.

### 3. **Weather Library**
   - Integrates the `weather` library for efficient handling of weather-related data.
   - Provides a structured way to parse and manage the weather data fetched from the API.

### 4. **State Management with GetX**
   - Uses the `GetX` library for state management, dependency injection, and routing.
   - Ensures smooth and efficient state transitions with minimal boilerplate code.
   - Provides a simple way to manage application states, making the app easy to maintain and scale.

## Features

- **Search for Cities:** 
  - Search functionality that allows users to input the name of a city to get its weather forecast.
  
- **Hourly Weather Forecast:**
  - Displays the weather forecast for the next 24 hours with a 3-hour interval. 

- **Weather Details:**
  - Provides detailed weather information such as temperature, humidity, wind speed, and weather conditions for each 3-hour interval.

- **Smooth Navigation:**
  - Uses `GetX` for seamless navigation between different screens, ensuring a user-friendly experience.

## How to Use

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-repo/weather-app.git
   ```
2. **Navigate to the project directory:**
   ```bash
   cd weather-app
   ```
3. **Install dependencies:**
   ```bash
   flutter pub get
   ```
4. **Run the app:**
   ```bash
   flutter run
   ```

## API Setup

To use the OpenWeatherMap API, you need to get an API key:

1. Visit [OpenWeatherMap](https://openweathermap.org/api) and sign up for a free API key.
2. Replace the placeholder API key in the app with your own in the `lib/services/api_service.dart` file:
   ```dart
   const String apiKey = 'YOUR_API_KEY';
   ```

## Dependencies

Make sure the following dependencies are added to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  get:
  dio: ^4.0.0
  weather:
  screen_util:
```

## Screenshots

(Add screenshots of your app here)

## Contribution

Feel free to fork the repository and submit a pull request. For significant changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Happy Coding! 🌤️
