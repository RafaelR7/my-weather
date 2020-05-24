import 'package:flutter/foundation.dart';

class Weather {
  final String location;
  final String description;
  final int temperature;
  final int humidity;
  final int windSpeed;
  final int visibility;
  final double precip;

  Weather({
    @required this.location,
    @required this.description,
    @required this.temperature,
    @required this.humidity,
    @required this.windSpeed,
    @required this.visibility,
    @required this.precip,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      location: json['location']['name'] as String,
      description: json['current']['weather_descriptions'][0] as String,
      temperature: json['current']['temperature'] as int,
      humidity: json['current']['humidity'] as int,
      windSpeed: json['current']['wind_speed'] as int,
      visibility: json['current']['visibility'] as int,
      precip: json['current']['precip'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': this.location,
      'temperature': this.temperature,
      'humidity': this.humidity,
      'windSpeed': this.windSpeed,
      'visibility': this.visibility,
      'precip': this.precip,
    };
  }

  @override
  String toString() {
    return "location: $location, temperature: $temperature, humidity: $humidity, windSpeed: $windSpeed, visibility: $visibility, precip: $precip";
  }
}
