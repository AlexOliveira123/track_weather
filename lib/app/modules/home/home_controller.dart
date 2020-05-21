import 'package:mobx/mobx.dart';
import '../../../app/models/forecast_weather_model.dart';
import '../../../app/models/open_weather_model.dart';
import '../../../app/repositories/open_weather_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final OpenWeatherRepository openWeatherRepository;

  _HomeControllerBase(this.openWeatherRepository);

  @observable
  String search;

  @observable
  ObservableFuture<OpenWeather> currentWeather;

  @observable
  ObservableFuture<ForecastWeather> forecastByNextDays;

  @action
  void onChangedSearch(String value) => search = value;

  @action
  void getCurrentWeather() {
    currentWeather = openWeatherRepository
    .getCurrenctWeather(search)
    .asObservable();
  }

  @action
  void getForecastByNextDays() {
    forecastByNextDays = openWeatherRepository
    .getForecastByNextDays(search)
    .asObservable();
  }
}
