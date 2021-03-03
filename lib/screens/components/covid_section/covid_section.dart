import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:today_weather/screens/components/common/error_content.dart';
import 'package:today_weather/screens/components/common/loading.dart';
import 'package:today_weather/screens/components/covid_section/covid_column.dart';
import 'package:today_weather/stores/covid_store.dart';

class CovidSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _covidStore = Provider.of<CovidStore>(context, listen: true);
    return Observer(
      builder: (_) {
        Widget display;
        switch (_covidStore.state) {
          case CodvidState.initial:
            _covidStore.errorMessage == null
                ? display = Container()
                : display = ErrorContent(title: _covidStore.errorMessage);
            break;
          case CodvidState.loading:
            display = Loading();
            break;
          case CodvidState.loaded:
            display = CovidColumn(
              covid: _covidStore.covid,
            );
            break;
        }
        return display;
      },
    );
  }
}
