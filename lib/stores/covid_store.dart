import 'package:today_weather/data/covid_repository.dart';
import 'package:today_weather/data/models/covid.dart';
import 'package:mobx/mobx.dart';

part 'covid_store.g.dart';

class CovidStore extends _CovidStore with _$CovidStore {
  CovidStore(CovidRepository covidRepository) : super(covidRepository);
}

enum CodvidState {
  initial,
  loading,
  loaded,
}

abstract class _CovidStore with Store {
  final CovidRepository _covidRepository;

  _CovidStore(this._covidRepository);

  @observable
  ObservableFuture<Covid> _covidFuture;

  @observable
  Covid covid;

  @observable
  String errorMessage;

  @computed
  CodvidState get state {
    if (_covidFuture == null || _covidFuture.status == FutureStatus.rejected) {
      return CodvidState.initial;
    }
    return _covidFuture.status == FutureStatus.pending
        ? CodvidState.loading
        : CodvidState.loaded;
  }

  @action
  Future getCovidTHData() async {
    try {
      errorMessage = null;
      _covidFuture = ObservableFuture(
        _covidRepository.fetchCovidData(),
      );
      covid = await _covidFuture;
    } catch (e) {
      errorMessage = "Couldn't fetch Report. Is the device online?";
    }
  }
}
