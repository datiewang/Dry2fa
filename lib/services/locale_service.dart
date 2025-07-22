import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleService extends ChangeNotifier {
  static const String _localeKey = 'selected_locale';
  Locale? _locale;

  Locale? get locale => _locale;

  LocaleService() {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(_localeKey);
    if (localeCode != null) {
      _locale = Locale(localeCode);
      notifyListeners();
    }
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
    notifyListeners();
  }

  static const List<Locale> supportedLocales = [
    Locale('zh'), // 中文 - 默认放在第一位
    Locale('ja'), // 日文
    Locale('en'), // 英文
  ];

  static const Map<String, String> localeNames = {
    'zh': '中文',
    'ja': '日本語',
    'en': 'English',
  };
}