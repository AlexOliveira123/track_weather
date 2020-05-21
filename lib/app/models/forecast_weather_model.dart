
import '../../app/models/open_weather_model.dart';
import 'city_model.dart';


class ForecastWeather {
  String cod;
  int message;
  int cnt;
  List<OpenWeather> list;
  City city;

  ForecastWeather({this.cod, this.message, this.cnt, this.list, this.city});

  ForecastWeather.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = <OpenWeather>[];
      json['list'].forEach((v) {
        list.add(OpenWeather.fromJson(v));
      });
    }
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cod'] = cod;
    data['message'] = message;
    data['cnt'] = cnt;
    if (list != null) {
      data['list'] = list.map((v) => v.toJson()).toList();
    }
    if (city != null) {
      data['city'] = city.toJson();
    }
    return data;
  }
}