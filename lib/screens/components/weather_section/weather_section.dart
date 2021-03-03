import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:today_weather/screens/components/common/error_content.dart';
import 'package:today_weather/screens/components/common/loading.dart';
import 'package:today_weather/screens/components/weather_section/weather_column.dart';
import 'package:today_weather/stores/weather_store.dart';

class WeatherSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _weatherStore = Provider.of<WeatherStore>(context, listen: true);
    return Observer(
      builder: (_) {
        Widget display;
        switch (_weatherStore.state) {
          case WeatherState.initial:
            _weatherStore.errorMessage == null
                ? display = Container()
                : display = ErrorContent(title: _weatherStore.errorMessage);
            break;
          case WeatherState.loading:
            display = Loading();
            break;
          case WeatherState.loaded:
            display = WeatherColumn(
              weather: _weatherStore.weather,
            );
        }
        return display;
      },
    );
  }
}
