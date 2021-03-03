import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:today_weather/data/models/weather.dart';
import 'package:flare_flutter/flare_actor.dart';

class CurrentWeather extends StatelessWidget {
  final Weather weather;

  const CurrentWeather({
    @required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 200.0,
          child: FlareActor(
            weather.flareAssets(weather.icon),
            alignment: Alignment.topCenter,
            animation: weather.icon,
          ),
        ),
        Text(
          weather.name,
          style: TextStyle(color: Colors.white),
        ),
        Text(
          weather.main,
          style: TextStyle(color: Colors.white, fontSize: 32.0),
        ),
        Text(
          '${weather.temp.toString()}°C',
          style: TextStyle(color: Colors.white),
        ),
        Text(
          DateFormat.yMMMd().format(weather.date),
          style: TextStyle(color: Colors.white),
        ),
        Text(
          DateFormat.Hm().format(weather.date),
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
