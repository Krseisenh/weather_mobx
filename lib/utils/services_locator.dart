import 'package:get_it/get_it.dart';

import 'components/http_client.dart';

final GetIt serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerSingleton<HttpClient>(HttpClient());
}
