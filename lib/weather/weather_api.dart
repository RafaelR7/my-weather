import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:my_weather/weather/models/weather_model.dart';

class WeatherApi {
  static const baseUrl = 'http://api.weatherstack.com';
  static const key = '85eb49ae69d29bedaefa2d757541834b';

  Future<Position> _getCurrentLocation() async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    Position pos = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return pos;
  }

  Future<Weather> fetchWeather() async {
    Position position = await _getCurrentLocation();
    final weatherApiUrl =
        "$baseUrl/current?access_key=$key&query=${position.latitude},${position.longitude}";

    Response res = await get(weatherApiUrl);
    if (res.statusCode == 200) {
      return Weather.fromJson(json.decode(res.body));
    } else {
      throw "Can't get weather forecast";
    }
  }
}
