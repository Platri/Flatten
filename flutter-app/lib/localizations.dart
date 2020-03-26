import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return Intl.message('Flatten',
        name: 'title', desc: 'The application title');
  }

  String get hello {
    return Intl.message('Hello', name: 'hello');
  }

  String get pvhtitel {
    return Intl.message('pvhtitel', name: 'pvhtitel');
  }

  String get createQrCodeTitleLabel {
    return Intl.message('Create Permanent QR', name: 'createQrCodeTitleLabel');
  }

  String get handshakeListTitleLabel {
    return Intl.message('Handshake List', name: 'handshakeListTitleLabel');
  }

  String get healthLogbookTitleLabel {
    return Intl.message('Health Logbook', name: 'healthLogbookTitleLabel');
  }

  String get reportsTitleLabel {
    return Intl.message('Reports', name: 'reportsTitleLabel');
  }

  String get virtualHandshakeTitleLabel {
    return Intl.message('Virtual Handshake',
        name: 'virtualHandshakeTitleLabel');
  }

  String get reportsButtonLabel {
    return Intl.message('Upload my test', name: 'reportsButtonLabel');
  }

  String get reportsTextLabel {
    return Intl.message(
        'If you have been tested positively for Corona you need to photograph your test. It will then be sent to your healthcare authority and people you had contact with will be notified and can be tested.',
        name: 'reportsTextLabel');
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['de', 'en'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
