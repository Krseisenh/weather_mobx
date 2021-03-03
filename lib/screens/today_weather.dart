import 'package:flutter/material.dart';
import 'package:today_weather/data/covid_repository.dart';
import 'package:today_weather/data/forecast_repository.dart';
import 'package:today_weather/data/weather_repository.dart';
import 'package:today_weather/screens/dashboard_page.dart';
import 'package:today_weather/stores/covid_store.dart';
import 'package:today_weather/stores/forecast_store.dart';
import 'package:today_weather/stores/weather_store.dart';
import 'package:today_weather/utils/config_reader.dart';
import 'package:provider/provider.dart';

class TodayWeather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<WeatherStore>(
          create: (_) => WeatherStore(
            FetchWeatherSystem(),
          ),
        ),
        Provider<ForecastStore>(
          create: (_) => ForecastStore(
            FetchForecastSystem(),
          ),
        ),
        Provider<CovidStore>(
          create: (_) => CovidStore(
            FetchCovidSystem(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Today Weather',
        home: DashboardPage(),
        debugShowCheckedModeBanner: ConfigReader.showDebugBanner(),
      ),
    );
  }
}
