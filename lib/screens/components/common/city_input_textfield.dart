import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:today_weather/stores/covid_store.dart';
import 'package:today_weather/stores/forecast_store.dart';
import 'package:today_weather/stores/weather_store.dart';
import 'package:provider/provider.dart';

class CityInputField extends StatelessWidget {
  final Location location = Location();
  static bool _serviceEnabled;
  static PermissionStatus _permissionGranted;
  static LocationData _locationData;
  static String error;

  @override
  Widget build(BuildContext context) {
    final _weatherStore = Provider.of<WeatherStore>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: Icon(Icons.search),
        ),
        onChanged: (value) => _weatherStore.setInputCity(value),
      ),
    );
  }

  Future<void> submitCityName(BuildContext context) async {
    final weatherStore = Provider.of<WeatherStore>(context, listen: false);
    final forecastStore = Provider.of<ForecastStore>(context, listen: false);
    final covidStore = Provider.of<CovidStore>(context, listen: false);

    try {
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      _locationData = await location.getLocation();

      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error =
            'Permission denied - please ask the user to enable it from the app settings';
      }

      _locationData = null;
    }

    if (location != null) {
      weatherStore.getWeather(
        weatherStore.inputCity,
        _locationData.latitude,
        _locationData.longitude,
      );

      forecastStore.getForecast(
        weatherStore.inputCity,
        _locationData.latitude,
        _locationData.longitude,
      );
    }
    covidStore.getCovidTHData();
  }
}
