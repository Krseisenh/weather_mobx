import 'dart:async';

import 'package:flare_flutter/flare_cache.dart';
import 'package:flutter/material.dart';
import 'package:today_weather/screens/today_weather.dart';
import 'package:today_weather/utils/config_reader.dart';
import 'package:today_weather/utils/services_locator.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();
  await setupLocator();
  FlareCache.doesPrune = false;
  runApp(TodayWeather());
}
