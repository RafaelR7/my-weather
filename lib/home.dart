import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_weather/styles/styles.dart';
import 'package:my_weather/weather/weather_card.dart';
import 'package:my_weather/weather/weather_store.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                          temperature(),
                          SizedBox(height: 10),
                          description(),
                          SizedBox(height: 10),
                          location(),
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
                            type: "Wind",
                          ),
                          WeatherCard(
                            icon: FontAwesomeIcons.tint,
                            value: "${_weatherStore.weather.humidity}%",
                            type: "Humidity",
                          ),
                          WeatherCard(
                            icon: FontAwesomeIcons.tachometerAlt,
                            value: "${_weatherStore.weather.precip}hpa",
                            type: "Precip",
                          ),
                          WeatherCard(
                            icon: FontAwesomeIcons.eye,
                            value: "${_weatherStore.weather.visibility}km",
                            type: "Visibility",
                          )
                        ],
                      ),
                    ),
                  ],
                )
              : Container(),
        ),
      ),
    );
  }

  Widget temperature() {
    return Text(
      "${_weatherStore.weather.temperature}°",
      style: Styles.mainTheme.textTheme.title,
    );
  }

  Widget description() {
    return Text("${_weatherStore.weather.description}",
        style: Styles.mainTheme.textTheme.body2);
  }

  Widget location() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.place, color: Colors.white),
        Text(
          " ${_weatherStore.weather.location}",
          style: Styles.mainTheme.textTheme.subtitle,
        )
      ],
    );
  }
}
