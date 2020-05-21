import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import '../../../modules/home/widgets/detailed_weather.dart';
import '../../../modules/home/widgets/search_field.dart';
import '../home_controller.dart';

class ForescastWeatherPage extends StatefulWidget {
  @override
  _ForescastWeatherPageState createState() => _ForescastWeatherPageState();
}

class _ForescastWeatherPageState
    extends ModularState<ForescastWeatherPage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forescast by next days'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Search the forecast by next days in your city',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: 20,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                Image.asset(
                  'assets/images/img4.png',
                ),
                SearchField(),
                SizedBox(
                  height: 15,
                ),
                Observer(builder: (_) {
                  return RaisedButton.icon(
                    onPressed: controller.search == null ||
                            controller.search.length < 3
                        ? null
                        : () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          controller.getForecastByNextDays();
                        },
                    icon: Icon(Icons.search),
                    label: Text('Search'),
                  );
                }),
                SizedBox(
                  height: 15,
                ),
                Observer(builder: (_) {
                  //Condition when the user access the page
                  // and don't throw an error
                  // for not have the data.
                  if (controller.forecastByNextDays == null) {
                    return Container();
                  }

                  //Error handling when research, if it occurs.
                  if (controller.forecastByNextDays.error != null) {
                    print(controller.forecastByNextDays.error.toString());
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "An error occurred while performing the search.",
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  var forecastWeather = controller.forecastByNextDays.value;

                  //Loader, for when the user does the search.
                  if (forecastWeather == null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  //If the api not found what is searched,
                  //will show this message.
                  if (forecastWeather.city == null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Search not found.'),
                    );
                  }

                  //If all occurs well, will show the list with the data
                  //of forecast by next days.
                  var formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: forecastWeather.list.length,
                    itemBuilder: (context, idx) {
                      var item = forecastWeather.list[idx];

                      return Card(
                        elevation: 4,
                        child: ExpansionTile(
                          title: Text(item.weather[0].description),
                          subtitle: Text(
                            formatter.format(DateTime.parse(item.dtTxt)),
                          ),
                          children: <Widget>[
                            DetailedWeather(
                              openWeather: item,
                            )
                          ],
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
