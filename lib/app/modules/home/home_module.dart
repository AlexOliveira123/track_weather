import 'package:flutter_modular/flutter_modular.dart';
import '../../../app/modules/home/home_controller.dart';
import '../../../app/modules/home/home_page.dart';
import '../../../app/modules/home/pages/current_weather_page.dart';
import '../../../app/modules/home/pages/forecast_weather_page.dart';
import '../../../app/repositories/open_weather_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get()),),
        Bind((i) => OpenWeatherRepository(i.get()),),
      ];

  @override
  List<Router> get routers => [
    Router(
      Modular.initialRoute,
      child: (_, args) => HomePage(),
    ),
    Router(
      '/current-weather',
      child: (_, args) => CurrentWeatherPage(),
    ),
    Router(
      '/forecast-weather',
      child: (_, args) => ForescastWeatherPage(),
    ),
  ];

  static Inject get to => Inject<HomeModule>.of();
}
