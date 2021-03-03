import 'package:flutter/material.dart';
import 'package:today_weather/screens/components/common/city_input_textfield.dart';
import 'package:today_weather/screens/components/covid_section/covid_section.dart';
import 'package:today_weather/screens/components/forecast_section/forecast_section.dart';
import 'package:today_weather/screens/components/weather_section/weather_section.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CityInputField(),
                WeatherSection(),
                ForecastSection(),
                CovidSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
