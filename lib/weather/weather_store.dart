import 'package:mobx/mobx.dart';
import 'package:my_weather/service/weather_api.dart';
import 'package:my_weather/weather/models/weather_model.dart';

part 'weather_store.g.dart';

class WeatherStore = WeatherBase with _$WeatherStore;

abstract class WeatherBase with Store {
  @observable
  Weather weather;

  @action
  getWeather() async {
    weather = await WeatherApi().fetchWeather();
  }
}
