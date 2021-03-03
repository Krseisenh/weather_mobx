import 'package:flutter/material.dart';
import 'package:today_weather/data/models/forecast.dart';
import 'package:today_weather/data/models/weather.dart';
import 'package:today_weather/screens/components/forecast_section/forecast_item.dart';

class ForecastRow extends StatelessWidget {
  final Forecast forecast;

  const ForecastRow({
    Key key,
    this.forecast,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Divider(
          indent: 50.0,
          endIndent: 50.0,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
          ),
          child: Container(
            height: 200.0,
            child: forecast != null
                ? ListView.builder(
                    itemCount: forecast.list.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ForecastItem(
                      weather: forecast.list.elementAt(index) as Weather,
                    ),
                  )
                : Container(),
          ),
        ),
        const Divider(
          indent: 50.0,
          endIndent: 50.0,
        ),
      ],
    );
  }
}
