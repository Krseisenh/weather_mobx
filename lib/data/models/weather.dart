import 'package:meta/meta.dart';

class Weather {
  final DateTime date;
  final String name;
  final double temp;
  final String main;
  final String icon;

  Weather({
    @required this.date,
    @required this.name,
    @required this.temp,
    @required this.main,
    @required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      date: DateTime.fromMillisecondsSinceEpoch(
        (json['dt'] as int) * 1000,
        isUtc: false,
      ),
      name: json['name'] as String,
      temp: json['main']['temp'].toDouble() as double,
      main: json['weather'][0]['main'] as String,
      icon: json['weather'][0]['icon'] as String,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Weather && o.name == name && o.temp == temp;
  }

  @override
  int get hashCode => name.hashCode ^ temp.hashCode;

  String flareAssets(String mapIcon) {
    return 'assets/flares/weather_$mapIcon.flr';
  }
}
