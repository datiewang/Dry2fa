// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Dry2FA';

  @override
  String get appDescription => 'Dry2FA - Windows 2FA Authentication Manager';

  @override
  String get addAuth => 'Add 2FA Authentication';

  @override
  String get noAuthYet => 'No 2FA authentications yet';

  @override
  String get addFirstAuth =>
      'Use the button below to add your first 2FA authentication';

  @override
  String get add => 'Add';

  @override
  String get delete => 'Delete';

  @override
  String get cancel => 'Cancel';

  @override
  String get deleteConfirmTitle => 'Confirm Deletion';

  @override
  String get deleteConfirmContent =>
      'Are you sure you want to delete this 2FA authentication?';

  @override
  String get serviceName => 'Service Name';

  @override
  String get serviceNameHint => 'e.g.: Google, GitHub, Microsoft';

  @override
  String get serviceNameHelper =>
      'Either service name or account name must be entered';

  @override
  String get accountName => 'Account Name (Optional)';

  @override
  String get accountNameHint => 'e.g.: john@example.com';

  @override
  String get secretKey => 'Secret Key *';

  @override
  String get secretKeyHint => 'Enter 32-digit Base32 secret key';

  @override
  String get serviceOrAccountRequired =>
      'Either service name or account name is required';

  @override
  String get secretKeyRequired => 'Please enter the secret key';

  @override
  String get secretKeyMinLength =>
      'Secret key must be at least 16 characters long';

  @override
  String get codeCopied => 'Code copied to clipboard';

  @override
  String dataLoadFailed(String error) {
    return 'Failed to load data: $error';
  }

  @override
  String updateIn(int seconds) {
    return 'Updates in $seconds seconds';
  }

  @override
  String get unnamedAccount => 'Unnamed Account';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get languageChineseDesc => 'Simplified Chinese';

  @override
  String get languageJapaneseDesc => 'Japanese';

  @override
  String get languageEnglishDesc => 'English';

  @override
  String get about => 'About';

  @override
  String version(String versionNumber) {
    return 'Version $versionNumber';
  }
}
