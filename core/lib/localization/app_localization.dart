import 'dart:ui';

class AppLocalization {
  static const String langsFolderPath = 'packages/core/resources/translations';

  /// appLocator<PrefsProvider>().getLocale() ?? _enLocale
  static List<Locale> get supportedLocales => <Locale>[
        _enLocale,
        _ruLocale,
      ];

  static Locale get fallbackLocale => _ruLocale;
  static const Locale _enLocale = Locale('en');
  static const Locale _ruLocale = Locale('ru');
}
