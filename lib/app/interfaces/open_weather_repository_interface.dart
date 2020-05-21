import '../../app/models/forecast_weather_model.dart';
import '../../app/models/open_weather_model.dart';

abstract class IOpenWeatherRepository {
  Future<OpenWeather> getCurrenctWeather(String search);
  Future<ForecastWeather> getForecastByNextDays(String search);
}