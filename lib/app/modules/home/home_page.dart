import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Weather'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  "Search your city's weather and forecasts",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        fontSize: 20,
                      ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                Image.asset('assets/images/img2.png'),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () => Modular.link.pushNamed('/current-weather'),
                  child: Text('Current Weather'),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () => Modular.link.pushNamed('/forecast-weather'),
                  child: Text('Forecast for the next 5 days'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
