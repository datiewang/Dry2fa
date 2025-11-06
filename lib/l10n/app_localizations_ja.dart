// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'Dry2FA';

  @override
  String get appDescription => 'Dry2FA - Windows向け2FA認証マネージャー';

  @override
  String get addAuth => '2FA認証を追�?;

  @override
  String get noAuthYet => 'まだ2FA認証がありません';

  @override
  String get addFirstAuth => '下のボタンで最初の2FA認証を追加してくださ�?;

  @override
  String get add => '追加';

  @override
  String get delete => '削除';

  @override
  String get cancel => 'キャンセ�?;

  @override
  String get deleteConfirmTitle => '削除の確�?;

  @override
  String get deleteConfirmContent => 'この2FA認証を削除してよろしいですか�?;

  @override
  String get serviceName => 'サービス�?;

  @override
  String get serviceNameHint => '例：Google, GitHub, Microsoft';

  @override
  String get serviceNameHelper => 'サービス名またはアカウント名のどちらか一つは入力してください';

  @override
  String get accountName => 'アカウント名（任意）';

  @override
  String get accountNameHint => '例：john@example.com';

  @override
  String get secretKey => 'シークレットキー *';

  @override
  String get secretKeyHint => '32桁のBase32シークレットキーを入�?;

  @override
  String get serviceOrAccountRequired => 'サービス名またはアカウント名のどちらか一つは必要です';

  @override
  String get secretKeyRequired => 'シークレットキーを入力してくださ�?;

  @override
  String get secretKeyMinLength => 'シークレットキーは最�?6桁必要で�?;

  @override
    @override
  String get secretKeyInvalid => '���`����åȥ��`��Base32��A�CZ, 2�C7���Ǥ����Ҫ������ޤ�';

String get codeCopied => 'コードをコピーしまし�?;

  @override
  String dataLoadFailed(String error) {
    return 'データの読み込みに失敗しまし�? $error';
  }

  @override
  String updateIn(int seconds) {
    return '$seconds秒後に更�?;
  }

  @override
  String get unnamedAccount => '名称未設�?;

  @override
  String get settings => '設定';

  @override
  String get language => '言�?;

  @override
  String get languageChineseDesc => '簡体字中国語';

  @override
  String get languageJapaneseDesc => '日本�?;

  @override
  String get languageEnglishDesc => '英語';

  @override
  String get about => 'アプリについ�?;

  @override
  String version(String versionNumber) {
    return 'バージョ�?$versionNumber';
  }
}
