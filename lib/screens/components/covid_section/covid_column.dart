import 'package:flutter/material.dart';
import 'package:today_weather/data/models/covid.dart';
import 'package:today_weather/screens/components/covid_section/data_tile.dart';

class CovidColumn extends StatelessWidget {
  final Covid covid;

  const CovidColumn({
    this.covid,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Center(
          child: Text(
            'COVID-19 TH Report',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: DataTile(
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _textStack(
                    topic: 'Total Confirmed',
                    current: covid?.confirmed.toString(),
                    additional: covid?.newConfirm.toString(),
                  ),
                  Material(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.timeline,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: DataTile(
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _textStack(
                    topic: 'Total Recovered',
                    current: covid?.recovered.toString(),
                    additional: covid?.newRecovered.toString(),
                  ),
                  Material(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.restore,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: DataTile(
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _textStack(
                    topic: 'Total Hospitalized',
                    current: covid?.hospitalized.toString(),
                    additional: covid?.newHospitalized.toString(),
                  ),
                  Material(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.local_hospital,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: DataTile(
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _textStack(
                    topic: 'Total Deaths',
                    current: covid?.deaths.toString(),
                    additional: covid?.newDeaths.toString(),
                  ),
                  Material(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.highlight_off,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              covid?.updateDated,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 24.0,
              ),
            ),
          ),
        ),
        Center(child: Text(covid?.source)),
        Container(
          height: 25,
        )
      ],
    );
  }

  Widget _textStack({
    String topic,
    String current,
    String additional,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          topic,
          style: TextStyle(color: Colors.blueAccent),
        ),
        Text(
          '$current [$additional]',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 34.0,
          ),
        )
      ],
    );
  }
}
