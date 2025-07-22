# Flutter 2FA Manager | 二维验证码管理器 | 2FA認証マネージャー

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://www.microsoft.com/windows)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)

🌍 **Multi-Language Support**: English | 中文 | 日本語

A powerful Flutter-based Two-Factor Authentication (2FA/TOTP) code generator application for Windows with complete internationalization support. Generate secure verification codes for your accounts with an intuitive interface available in English, Chinese, and Japanese.

一个基于Flutter的双重身份验证(2FA)验证码生成器，支持中文、英文、日文三种语言界面，为Windows用户提供安全便捷的二次验证码管理。

Windows向けのFlutter製2FA認証コード生成アプリケーション。中国語、英語、日本語の3言語に対応し、直感的なインターフェースで安全な認証コード管理を提供します。

## ✨ Features | 功能特性 | 機能

### 🔐 Security & Authentication | 安全认证 | セキュリティ
- ✅ **TOTP/2FA Code Generation** - Generate secure time-based authentication codes
- ✅ **Manual Secret Key Import** - Support for standard Base32 secret keys
- ✅ **Local Storage Only** - All data stored securely on your device
- ✅ **No Network Required** - Works completely offline

### 🌍 Multi-Language Support | 多语言支持 | 多言語サポート
- ✅ **English Interface** - Complete English localization
- ✅ **中文界面** - 完整的简体中文支持
- ✅ **日本語インターフェース** - 完全な日本語ローカライゼーション
- ✅ **Auto Language Detection** - Automatically detects system language
- ✅ **Manual Language Switch** - Change language anytime in settings

### 💻 User Experience | 用户体验 | ユーザーエクスペリエンス  
- ✅ **One-Click Copy** - Automatic clipboard copy with visual feedback
- ✅ **Real-Time Countdown** - Visual timer showing code expiration
- ✅ **Modern UI Design** - Clean, intuitive Material Design 3 interface
- ✅ **Account Management** - Easy add/delete of authentication entries
- ✅ **Windows Optimized** - Native Windows desktop application  

## Quick Start

1. **Launch the application**
   ```bash
   cd flutter_2fa_manager
   flutter run -d windows
   ```

2. **Add your first 2FA authentication**
   - Click the "+" button in the bottom right corner
   - Enter account information and secret key
   - Click "Add" to save

3. **Generate verification codes**
   - Click on any 2FA card
   - The verification code will be displayed and automatically copied to clipboard

## Test Example

You can use the following test key to experience the app functionality:
- Issuer: Test Service
- Account: test@example.com  
- Secret Key: JBSWY3DPEHPK3PXP

## Build for Release

To create a Windows release build, run:
```bash
flutter build windows --release
```

## 📸 Screenshots | 截图 | スクリーンショット

*Coming soon - Application screenshots in all supported languages*

## 🏷️ Keywords | 关键词 | キーワード

**English**: Flutter 2FA, Two-Factor Authentication, TOTP, Authenticator App, Windows 2FA, OTP Generator, Security App, Authentication Manager, Multi-language 2FA

**中文**: Flutter二维验证, 双重身份验证, 谷歌验证器, Windows验证码, 动态口令, 安全应用, 认证管理器, 多语言2FA, TOTP生成器

**日本語**: Flutter 2FA, 二段階認証, 認証アプリ, Windows認証, ワンタイムパスワード, セキュリティアプリ, 認証管理, 多言語対応2FA

## 🌟 Why Choose This 2FA Manager | 为什么选择这个2FA管理器 | この2FA管理ツールを選ぶ理由

- 🔒 **Privacy First** - No cloud sync, all data stays on your device
- 🌍 **True Multilingual** - Native support for 3 languages, not just translations  
- 🎨 **Modern Design** - Beautiful Material Design 3 interface
- ⚡ **Lightning Fast** - Built with Flutter for optimal performance
- 🛡️ **Open Source** - Transparent, secure, and community-driven

## 📱 Supported Services | 支持的服务 | 対応サービス

This app works with any service that provides standard TOTP/2FA secret keys, including:
- Google, Microsoft, GitHub, Facebook, Twitter
- Banking and financial services  
- VPN and security services
- Gaming platforms (Steam, Epic, etc.)
- And many more!

## 🤝 Contributing | 贡献 | コントリビューション

Contributions are welcome! Please feel free to submit issues and pull requests.

## 📄 License | 许可证 | ライセンス

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

The application is fully functional with all core features working properly!
