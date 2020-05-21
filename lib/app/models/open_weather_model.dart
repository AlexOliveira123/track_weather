import 'clouds_model.dart';
import 'coord_model.dart';
import 'main_model.dart';
import 'sys_model.dart';
import 'weather_model.dart';
import 'wind_model.dart';

class OpenWeather {
  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;
  String dtTxt;

  OpenWeather(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod,
      this.dtTxt});

  OpenWeather.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v));
      });
    }
    base = json['base'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    visibility = json['visibility'];
    wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    dt = json['dt'];
    sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    timezone = json['timezone'];
    id = json['id'];
    name = json['name'];
    cod = json['cod'];
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = coord.toJson();
    }
    if (weather != null) {
      data['weather'] = weather.map((v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds.toJson();
    }
    data['dt'] = dt;
    if (sys != null) {
      data['sys'] = sys.toJson();
    }
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    data['dt_txt'] = dtTxt;
    return data;
  }
}
