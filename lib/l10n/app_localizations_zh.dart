// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Dry2FA';

  @override
  String get appDescription => 'Dry2FA - Windows 2FA 身份验证管理器';

  @override
  String get addAuth => '添加 2FA 身份验证';

  @override
  String get noAuthYet => '还没有 2FA 身份验证';

  @override
  String get addFirstAuth => '使用下面的按钮添加您的第一个 2FA 身份验证';

  @override
  String get add => '添加';

  @override
  String get delete => '删除';

  @override
  String get cancel => '取消';

  @override
  String get deleteConfirmTitle => '确认删除';

  @override
  String get deleteConfirmContent => '您确定要删除这个 2FA 身份验证吗？';

  @override
  String get serviceName => '服务名称';

  @override
  String get serviceNameHint => '例如：Google, GitHub, Microsoft';

  @override
  String get serviceNameHelper => '必须输入服务名称或账户名称中的一个';

  @override
  String get accountName => '账户名称（可选）';

  @override
  String get accountNameHint => '例如：john@example.com';

  @override
  String get secretKey => '密钥 *';

  @override
  String get secretKeyHint => '输入 32 位 Base32 密钥';

  @override
  String get serviceOrAccountRequired => '服务名称或账户名称必须填写一个';

  @override
  String get secretKeyRequired => '请输入密钥';

  @override
  String get secretKeyMinLength => '密钥长度至少需要 16 位';

  @override
  String get secretKeyInvalid => '密钥必须为 Base32（A–Z, 2–7）';

  @override
  String get codeCopied => '验证码已复制到剪贴板';

  @override
  String dataLoadFailed(String error) {
    return '数据加载失败：$error';
  }

  @override
  String updateIn(int seconds) {
    return '$seconds 秒后更新';
  }

  @override
  String get unnamedAccount => '未命名账户';

  @override
  String get settings => '设置';

  @override
  String get language => '语言';

  @override
  String get languageChineseDesc => '简体中文';

  @override
  String get languageJapaneseDesc => '日语';

  @override
  String get languageEnglishDesc => '英语';

  @override
  String get about => '关于';

  @override
  String version(String versionNumber) {
    return '版本 $versionNumber';
  }
}
