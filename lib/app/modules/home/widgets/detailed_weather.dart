import 'package:flutter/material.dart';
import '../../../../app/models/open_weather_model.dart';
import '../../../../app/modules/home/widgets/custom_text.dart';

class DetailedWeather extends StatelessWidget {
  final OpenWeather openWeather;

  const DetailedWeather({Key key, this.openWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        openWeather.name != null
            ? Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: 'Current weather from ',
                    value: openWeather.name,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  openWeather.name ?? '',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  openWeather.weather.length > 0
                      ? openWeather.weather[0].description
                      : '',
                  style: TextStyle(color: Colors.black38),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Weather data:',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: 'Temp: ',
                  value: openWeather.main.temp.toString(),
                ),
                CustomText(
                  text: 'Feels like: ',
                  value: openWeather.main.feelsLike.toString(),
                ),
                CustomText(
                  text: 'Temp min: ',
                  value: openWeather.main.tempMin.toString(),
                ),
                CustomText(
                  text: 'Temp max: ',
                  value: openWeather.main.tempMax.toString(),
                ),
                CustomText(
                  text: 'Pressure: ',
                  value: openWeather.main.pressure.toString(),
                ),
                CustomText(
                  text: 'Humidity: ',
                  value: openWeather.main.humidity.toString(),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
