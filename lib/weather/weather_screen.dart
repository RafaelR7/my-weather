import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_weather/i18n/i18n.dart';
import 'package:my_weather/styles/styles.dart';
import 'package:my_weather/weather/weather_card.dart';
import 'package:my_weather/weather/weather_store.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherStore _weatherStore = WeatherStore();

  @override
  void initState() {
    super.initState();
    _weatherStore.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.black,
            ],
          ),
        ),
        child: Observer(
          builder: (_) => _weatherStore.weather != null
              ? Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height / 1.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "${_weatherStore.weather.temperature}°",
                            style: Styles.mainTheme.textTheme.title,
                          ),
                          SizedBox(height: 10),
                          Text("${_weatherStore.weather.description}",
                              style: Styles.mainTheme.textTheme.body2),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.place, color: Colors.white),
                              Text(
                                " ${_weatherStore.weather.location}",
                                style: Styles.mainTheme.textTheme.subtitle,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          WeatherCard(
                            icon: FontAwesomeIcons.wind,
                            value: "${_weatherStore.weather.windSpeed}km/h",
                            type: I18n.of(context).wind,
                          ),
                          WeatherCard(
                            icon: FontAwesomeIcons.tint,
                            value: "${_weatherStore.weather.humidity}%",
                            type: I18n.of(context).humidity,
                          ),
                          WeatherCard(
                            icon: FontAwesomeIcons.tachometerAlt,
                            value: "${_weatherStore.weather.precip}hpa",
                            type: I18n.of(context).preciptation,
                          ),
                          WeatherCard(
                            icon: FontAwesomeIcons.eye,
                            value: "${_weatherStore.weather.visibility}km",
                            type: I18n.of(context).visibility,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      SizedBox(height: 30),
                      Text(
                        "Loading...",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
