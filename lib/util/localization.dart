import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';


enum SupportLocale {
  en,
  ko,
}


class _JiffyLocalizationsDelegate extends LocalizationsDelegate<JiffyLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return Jiffy.getSupportedLocales().contains(locale.languageCode);
  }

  @override
  Future<JiffyLocalizations> load(Locale locale) {
    return JiffyLocalizations.load(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<JiffyLocalizations> old) {
    return false;
  }
}


class JiffyLocalizations {
  static Future<JiffyLocalizations> load(Locale locale) async {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localName = Intl.canonicalizedLocale(name);
    await Jiffy.setLocale(localName);
    return JiffyLocalizations();
  }

  static LocalizationsDelegate<JiffyLocalizations> delegate = _JiffyLocalizationsDelegate();
}
