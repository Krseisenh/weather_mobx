import 'package:today_weather/environment.dart';
import 'package:today_weather/main_common.dart';

Future<void> main() async {
  await mainCommon(Environment.test);
}
