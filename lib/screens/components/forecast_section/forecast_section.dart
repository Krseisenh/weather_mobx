import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:today_weather/screens/components/common/error_content.dart';
import 'package:today_weather/screens/components/common/loading.dart';
import 'package:today_weather/screens/components/forecast_section/forecast_row.dart';
import 'package:today_weather/stores/forecast_store.dart';

class ForecastSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _forecastStore = Provider.of<ForecastStore>(context, listen: true);
    return Observer(
      builder: (_) {
        Widget display;
        switch (_forecastStore.state) {
          case ForecastState.initial:
            _forecastStore.errorMessage == null
                ? display = Container()
                : display = ErrorContent(title: _forecastStore.errorMessage);
            break;
          case ForecastState.loading:
            display = Loading();
            break;
          case ForecastState.loaded:
            display = ForecastRow(
              forecast: _forecastStore.forecast,
            );
            break;
        }
        return display;
      },
    );
  }
}
