import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class ErrorContent extends StatelessWidget {
  final String title;
  const ErrorContent({this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                width: 200.0,
                height: 200.0,
                child: FlareActor(
                  'assets/flares/no-wifi.flr',
                  alignment: Alignment.topCenter,
                  animation: 'init',
                ),
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}
