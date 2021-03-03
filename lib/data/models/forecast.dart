import 'package:today_weather/data/models/weather.dart';

class Forecast {
  final List<dynamic> list;

  Forecast({
    this.list,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    final List list = [];

    for (final dynamic e in json['list']) {
      final Weather w = Weather(
        date: DateTime.fromMillisecondsSinceEpoch(
          (e['dt'] as int) * 1000,
          isUtc: false,
        ),
        name: json['city']['name'] as String,
        temp: e['main']['temp'].toDouble() as double,
        main: e['weather'][0]['main'] as String,
        icon: e['weather'][0]['icon'] as String,
      );
      list.add(w);
    }

    return Forecast(
      list: list,
    );
  }
}
