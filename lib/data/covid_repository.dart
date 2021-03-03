import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:today_weather/data/models/covid.dart';
import 'package:today_weather/utils/components/http_client.dart';
import 'package:today_weather/utils/services_locator.dart';

class FetchCovidSystem implements CovidRepository {
  final HttpClient client = serviceLocator<HttpClient>();

  @override
  Future<Covid> fetchCovidData() async {
    try {
      final Response response = await client.get(
        'https://covid19.th-stat.com/api/open/today',
      );
      return Covid.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      log(e.toString());
      throw Exception(e.toString());
    }
  }
}

abstract class CovidRepository {
  Future<Covid> fetchCovidData();
}
