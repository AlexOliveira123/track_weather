// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$searchAtom = Atom(name: '_HomeControllerBase.search');

  @override
  String get search {
    _$searchAtom.reportRead();
    return super.search;
  }

  @override
  set search(String value) {
    _$searchAtom.reportWrite(value, super.search, () {
      super.search = value;
    });
  }

  final _$currentWeatherAtom = Atom(name: '_HomeControllerBase.currentWeather');

  @override
  ObservableFuture<OpenWeather> get currentWeather {
    _$currentWeatherAtom.reportRead();
    return super.currentWeather;
  }

  @override
  set currentWeather(ObservableFuture<OpenWeather> value) {
    _$currentWeatherAtom.reportWrite(value, super.currentWeather, () {
      super.currentWeather = value;
    });
  }

  final _$forecastByNextDaysAtom =
      Atom(name: '_HomeControllerBase.forecastByNextDays');

  @override
  ObservableFuture<ForecastWeather> get forecastByNextDays {
    _$forecastByNextDaysAtom.reportRead();
    return super.forecastByNextDays;
  }

  @override
  set forecastByNextDays(ObservableFuture<ForecastWeather> value) {
    _$forecastByNextDaysAtom.reportWrite(value, super.forecastByNextDays, () {
      super.forecastByNextDays = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void onChangedSearch(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.onChangedSearch');
    try {
      return super.onChangedSearch(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getCurrentWeather() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getCurrentWeather');
    try {
      return super.getCurrentWeather();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getForecastByNextDays() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getForecastByNextDays');
    try {
      return super.getForecastByNextDays();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
search: ${search},
currentWeather: ${currentWeather},
forecastByNextDays: ${forecastByNextDays}
    ''';
  }
}
