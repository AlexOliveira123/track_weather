import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../app/modules/home/widgets/detailed_weather.dart';
import '../../../../app/modules/home/widgets/search_field.dart';
import '../home_controller.dart';

class CurrentWeatherPage extends StatefulWidget {
  @override
  _CurrentWeatherPageState createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState
    extends ModularState<CurrentWeatherPage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Current Weather',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Search the current weather of your city',
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: 20,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15,),
                Image.asset(
                  'assets/images/img1.png',
                ),
                SizedBox(
                  height: 1,
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
                          controller.getCurrentWeather();
                        },
                    icon: Icon(Icons.search),
                    label: Text('Search'),
                  );
                }),
                Observer(builder: (_) {
                  //Condition when the user access the page
                  // and don't throw an error
                  // for not have the data.
                  if (controller.currentWeather == null) {
                    return Container();
                  }

                  //Error handling when research, if it occurs.
                  if (controller.currentWeather.error != null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "An error occurred while performing the search.",
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  var openWeather = controller.currentWeather.value;

                  //Loader, for when the user does the search.
                  if (openWeather == null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  //If the api not found the what is searched,
                  //will show this message.
                  if (openWeather.name == null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Search not found.'),
                    );
                  }

                  //If all occurs well,  will show the data.
                  return DetailedWeather(
                    openWeather: openWeather,
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
