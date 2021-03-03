import 'package:today_weather/data/forecast_repository.dart';
import 'package:today_weather/data/models/forecast.dart';
import 'package:mobx/mobx.dart';

part 'forecast_store.g.dart';

class ForecastStore extends _ForecastStore with _$ForecastStore {
  ForecastStore(ForecastRepository forecastRepository)
      : super(forecastRepository);
}

enum ForecastState {
  initial,
  loading,
  loaded,
}

abstract class _ForecastStore with Store {
  final ForecastRepository _forecastRepository;

  _ForecastStore(this._forecastRepository);

  @observable
  ObservableFuture<Forecast> _forecastFuture;

  @observable
  Forecast forecast;

  @observable
  String errorMessage;

  @computed
  ForecastState get state {
    if (_forecastFuture == null ||
        _forecastFuture.status == FutureStatus.rejected) {
      return ForecastState.initial;
    }
    return _forecastFuture.status == FutureStatus.pending
        ? ForecastState.loading
        : ForecastState.loaded;
  }

  @action
  Future getForecast(
    String cityName,
    double latitude,
    double longtitute,
  ) async {
    try {
      errorMessage = null;
      _forecastFuture = ObservableFuture(
        _forecastRepository.fetchForecast(
          cityName: cityName,
          lat: latitude,
          lon: longtitute,
        ),
      );
      forecast = await _forecastFuture;
    } catch (e) {
      errorMessage = "Couldn't fetch Forecast. Is the device online?";
    }
  }
}
