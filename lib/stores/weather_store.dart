import 'package:mobx/mobx.dart';
import 'package:today_weather/data/models/weather.dart';
import 'package:today_weather/data/weather_repository.dart';

part 'weather_store.g.dart';

class WeatherStore extends _WeatherStore with _$WeatherStore {
  WeatherStore(WeatherRepository weatherRepository) : super(weatherRepository);
}

enum WeatherState {
  initial,
  loading,
  loaded,
}

abstract class _WeatherStore with Store {
  final WeatherRepository _weatherRepository;

  _WeatherStore(this._weatherRepository);

  @observable
  ObservableFuture<Weather> _weatherFuture;

  @observable
  String cityName;

  @observable
  Weather weather;

  @observable
  String errorMessage;

  @computed
  WeatherState get state {
    if (_weatherFuture == null ||
        _weatherFuture.status == FutureStatus.rejected) {
      return WeatherState.initial;
    }
    return _weatherFuture.status == FutureStatus.pending
        ? WeatherState.loading
        : WeatherState.loaded;
  }

  @computed
  String get inputCity => cityName;

  @action
  void setInputCity(String city) {
    cityName = city;
  }

  @action
  Future getWeather(String cityName, double latitude, double longtitute) async {
    try {
      errorMessage = null;
      _weatherFuture = ObservableFuture(
        _weatherRepository.fetchWeather(
          cityName: cityName,
          lat: latitude,
          lon: longtitute,
        ),
      );
      weather = await _weatherFuture;
    } catch (e) {
      errorMessage = "Couldn't fetch Weather. Is the device online?";
    }
  }
}
