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
  String get addAuth => '2FA認証を追加';

  @override
  String get noAuthYet => 'まだ2FA認証がありません';

  @override
  String get addFirstAuth => '下のボタンで最初の2FA認証を追加してください';

  @override
  String get add => '追加';

  @override
  String get delete => '削除';

  @override
  String get cancel => 'キャンセル';

  @override
  String get deleteConfirmTitle => '削除の確認';

  @override
  String get deleteConfirmContent => 'この2FA認証を削除してよろしいですか？';

  @override
  String get serviceName => 'サービス名';

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
  String get secretKeyHint => '32桁のBase32シークレットキーを入力';

  @override
  String get serviceOrAccountRequired => 'サービス名またはアカウント名のどちらか一つは必要です';

  @override
  String get secretKeyRequired => 'シークレットキーを入力してください';

  @override
  String get secretKeyMinLength => 'シークレットキーは最低16桁必要です';

  @override
  String get secretKeyInvalid => 'シークレットキーはBase32（A–Z, 2–7）である必要があります';

  @override
  String get codeCopied => 'コードをコピーしました';

  @override
  String dataLoadFailed(String error) {
    return 'データの読み込みに失敗しました：$error';
  }

  @override
  String updateIn(int seconds) {
    return '$seconds秒後に更新';
  }

  @override
  String get unnamedAccount => '名称未設定';

  @override
  String get settings => '設定';

  @override
  String get language => '言語';

  @override
  String get languageChineseDesc => '簡体字中国語';

  @override
  String get languageJapaneseDesc => '日本語';

  @override
  String get languageEnglishDesc => '英語';

  @override
  String get about => 'アプリについて';

  @override
  String version(String versionNumber) {
    return 'バージョン $versionNumber';
  }
}
