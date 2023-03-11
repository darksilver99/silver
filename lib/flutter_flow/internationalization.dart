import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['th', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? thText = '',
    String? enText = '',
  }) =>
      [thText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'oyufcm99': {
      'th': 'Page Title',
      'en': '',
    },
    'lzotjsb7': {
      'th': 'Button',
      'en': '',
    },
    'cn5e1xoa': {
      'th': 'Home',
      'en': '',
    },
  },
  // LoginPage
  {
    '5twv1ehv': {
      'th': 'Sign In',
      'en': '',
    },
    'wc8uabjw': {
      'th': 'Email',
      'en': '',
    },
    'ewe07n1n': {
      'th': '',
      'en': '',
    },
    'h97mstjh': {
      'th': 'Password',
      'en': '',
    },
    'za8uwlo0': {
      'th': '',
      'en': '',
    },
    'ejnygxw5': {
      'th': 'Sign In',
      'en': '',
    },
    'axtaj6hh': {
      'th': 'Sign Up',
      'en': '',
    },
    't9rdjeiy': {
      'th': 'Display Name',
      'en': '',
    },
    '3aihe2dt': {
      'th': '',
      'en': '',
    },
    'gkagdksc': {
      'th': 'Phone',
      'en': '',
    },
    'v97h7ghx': {
      'th': '',
      'en': '',
    },
    'ovw6kzrh': {
      'th': 'Email',
      'en': '',
    },
    's7thkiod': {
      'th': '',
      'en': '',
    },
    '40u75rvp': {
      'th': 'Password',
      'en': '',
    },
    'wpwthdke': {
      'th': '',
      'en': '',
    },
    '28daqync': {
      'th': 'Confirm password',
      'en': '',
    },
    'zoejj9hw': {
      'th': '',
      'en': '',
    },
    'jyhiazko': {
      'th': 'Sign Up',
      'en': '',
    },
    'leutk4vl': {
      'th': 'Home',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
