import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_weather/styles/styles.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    Key key,
    @required this.icon,
    @required this.value,
    @required this.type,
  }) : super(key: key);

  final IconData icon;
  final String value;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: RadialGradient(
            radius: 1.0,
            colors: [
              Colors.lightBlue[700],
              Colors.lightBlue[900],
            ],
          ),
        ),
        width: 150,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FaIcon(
                    icon,
                    color: Colors.white,
                    size: 50,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "$value",
                style: Styles.mainTheme.textTheme.body2,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                "$type",
                style: Styles.mainTheme.textTheme.body1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
