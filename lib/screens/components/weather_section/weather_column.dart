import 'package:flutter/material.dart';
import 'package:today_weather/data/models/weather.dart';
import 'package:today_weather/screens/components/weather_section/current_weather.dart';

class WeatherColumn extends StatelessWidget {
  final Weather weather;

  const WeatherColumn({
    this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          bottom: 20.0,
        ),
        child: CurrentWeather(
          weather: weather,
        ),
      ),
    );
  }
}
