// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherStore on WeatherBase, Store {
  final _$weatherAtom = Atom(name: 'WeatherBase.weather');

  @override
  Weather get weather {
    _$weatherAtom.context.enforceReadPolicy(_$weatherAtom);
    _$weatherAtom.reportObserved();
    return super.weather;
  }

  @override
  set weather(Weather value) {
    _$weatherAtom.context.conditionallyRunInAction(() {
      super.weather = value;
      _$weatherAtom.reportChanged();
    }, _$weatherAtom, name: '${_$weatherAtom.name}_set');
  }

  final _$getWeatherAsyncAction = AsyncAction('getWeather');

  @override
  Future getWeather() {
    return _$getWeatherAsyncAction.run(() => super.getWeather());
  }

  @override
  String toString() {
    final string = 'weather: ${weather.toString()}';
    return '{$string}';
  }
}
