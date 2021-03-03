import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:today_weather/data/models/weather.dart';
import 'package:today_weather/utils/components/http_client.dart';
import 'package:today_weather/utils/config_reader.dart';
import 'package:today_weather/utils/services_locator.dart';

class FetchWeatherSystem implements WeatherRepository {
  final HttpClient client = serviceLocator<HttpClient>();

  String apiKey = ConfigReader.getAPIKey();

  @override
  Future<Weather> fetchWeather({
    String cityName,
    double lat,
    double lon,
  }) async {
    try {
      final Response response = await client.get(
        'https://api.openweathermap.org/data/2.5/weather?APPID=$apiKey&lat=${lat.toString()}&lon=${lon.toString()}&units=metric',
      );

      return Weather.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}

abstract class WeatherRepository {
  Future<Weather> fetchWeather({
    String cityName,
    double lat,
    double lon,
  });
}
