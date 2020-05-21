import 'package:dio/dio.dart';
import '../../app/core/utils/constants.dart';
import '../../app/interfaces/open_weather_repository_interface.dart';
import '../../app/models/forecast_weather_model.dart';
import '../../app/models/open_weather_model.dart';

class OpenWeatherRepository implements IOpenWeatherRepository {
  final Dio dio;

  OpenWeatherRepository(this.dio);

  @override
  Future<ForecastWeather> getForecastByNextDays(String search) async {
    try {
      var response = await dio.get(
        '$baseUrl/forecast?q=$search&appid=$apiKey',
      );
      print('Response: ${response.data}');

      return response != null
          ? ForecastWeather.fromJson(response.data)
          : null;
    } on DioError catch (e) {
      if (e.response.statusCode != 404) {
        print(e.message);
        print(e.error);
      } else {
        print(e.response.statusCode);
      }
      return ForecastWeather();
    }
  }

  @override
  Future<OpenWeather> getCurrenctWeather(String search) async {
    try {
      var response = await dio.get(
        '$baseUrl/weather?q=$search&appid=$apiKey',
      );
      print('Response: ${response.data}');

      return response != null
          ? OpenWeather.fromJson(response.data)
          : null;

    } on DioError catch (e) {
      if (e.response.statusCode != 404) {
        print(e.message);
        print(e.error);
      } else {
        print(e.response.statusCode);
      }
      return OpenWeather();
    }
  }
}
