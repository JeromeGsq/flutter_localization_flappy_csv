import 'dart:async';

import 'package:flutter/material.dart';

/// This class is generated by the flappy_translator package
/// Please do not change anything manually in this file, instead re-generate it when changes are available
class I18n {
  String get title => _getText("title");

  String get hello => _getText("hello");

  String description({
    @required String name,
  }) {
    String text = _getText("description");
    if (name != null) {
      text = text.replaceAll("%name\$s", name);
    }
    return text;
  }

  static Map<String, String> _localizedValues;

  static Map<String, String> _enGBValues = {
    "title": "Hello world App from GB",
    "hello": "Hello",
    "description": "Nice to meet you %name\$s",
  };

  static Map<String, String> _enUSValues = {
    "title": "Hello world App from US",
    "hello": "Hello",
    "description": "Nice to meet you %name\$s",
  };

  static Map<String, String> _esESValues = {
    "title": "Hola from ES",
    "hello": "Hola amigo",
    "description": "Encantado de conocerte %name\$s",
  };

  static Map<String, String> _frFRValues = {
    "title": "Bonjour depuis FR",
    "hello": "Bonjour",
    "description": "Ravi de vous rencontrer %name\$s",
  };

  static Map<String, String> _deValues = {
    "title": " Hallo DE",
    "hello": " Hallo",
    "description": "Schön, Sie kennenzulernen %name\$s",
  };

  static Map<String, Map<String, String>> _allValues = {
    "en_GB": _enGBValues,
    "en_US": _enUSValues,
    "es_ES": _esESValues,
    "fr_FR": _frFRValues,
    "de": _deValues,
  };

  I18n(Locale locale) {
    this._locale = locale;
    _localizedValues = null;
  }

  Locale _locale;

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  String _getText(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  Locale get currentLocale => _locale;

  String get currentLanguage => _locale.languageCode;

  static Future<I18n> load(Locale locale) async {
    final translations = I18n(locale);
    _localizedValues = _allValues[locale.toString()];
    return translations;
  }
}

class I18nDelegate extends LocalizationsDelegate<I18n> {
  const I18nDelegate();

  static final Set<Locale> supportedLocals = {
    Locale('en', 'GB'),
    Locale('en', 'US'),
    Locale('es', 'ES'),
    Locale('fr', 'FR'),
    Locale('de'),
  };

  @override
  bool isSupported(Locale locale) => supportedLocals.contains(locale);

  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);

  @override
  bool shouldReload(I18nDelegate old) => false;
}
