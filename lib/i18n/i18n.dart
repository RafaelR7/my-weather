import 'package:flutter/material.dart';

class I18n {
  I18n(this.locale);

  final Locale locale;

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'wind': 'Wind',
      'humidity': 'Humidity',
      'visibility': 'Visibility',
      'preciptation': 'Preciptation',
    },
    'pt': {
      'wind': 'Vento',
      'humidity': 'Umidade',
      'visibility': 'Visibilidade',
      'preciptation': 'Preciptação',
    },
  };

  String get wind => _localizedValues[locale.languageCode]['wind'];
  String get humidity => _localizedValues[locale.languageCode]['humidity'];
  String get visibility => _localizedValues[locale.languageCode]['visibility'];
  String get preciptation =>
      _localizedValues[locale.languageCode]['preciptation'];
}
