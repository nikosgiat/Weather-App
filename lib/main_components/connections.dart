import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather/weather.dart';

WeatherFactory wf = WeatherFactory(dotenv.env['WEATHER_API_KEY']!, language: Language.GREEK);

//   Future<Weather> getCityTemp(String cityName) async {
//
//   Weather w = await wf.currentWeatherByCityName(cityName);
//
//   return w;
// }

// Future<List<Weather>> getCityForecast(String cityName) async {
//
//   List<Weather> forecast = await wf.fiveDayForecastByCityName(cityName);
//
//   return forecast;
// }