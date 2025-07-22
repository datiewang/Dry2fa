# 2FA Manager

A Flutter-based Two-Factor Authentication (2FA) code generator for Windows.

## Features

✅ Manual TOTP key import for 2FA authentication  
✅ List view of all configured 2FA accounts  
✅ One-click code generation with automatic clipboard copy  
✅ Real-time countdown timer display  
✅ Persistent local data storage  
✅ Delete unwanted authentication entries  

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

The application is fully functional with all core features working properly!
