import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:today_weather/data/models/weather.dart';

class ForecastItem extends StatelessWidget {
  final Weather weather;

  const ForecastItem({
    Key key,
    @required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              weather.name,
              style: TextStyle(color: Colors.black),
            ),
            Text(
              weather.main,
              style: TextStyle(color: Colors.black, fontSize: 24.0),
            ),
            Text(
              '${weather.temp.toString()}°C',
              style: TextStyle(color: Colors.black),
            ),
            Image.network(
              'https://openweathermap.org/img/w/${weather.icon}.png',
            ),
            Text(
              DateFormat.yMMMd().format(weather.date),
              style: TextStyle(color: Colors.black),
            ),
            Text(
              DateFormat.Hm().format(weather.date),
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
