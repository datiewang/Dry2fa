import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
=======
>>>>>>> 5d38d1d11d3970eae38942a087a906bdd4787f7d
import '../models/totp_item.dart';
import '../services/storage_service.dart';

class AddTotpPage extends StatefulWidget {
  @override
  _AddTotpPageState createState() => _AddTotpPageState();
}

class _AddTotpPageState extends State<AddTotpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _secretController = TextEditingController();
  final _issuerController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _secretController.dispose();
    _issuerController.dispose();
    super.dispose();
  }

  Future<void> _saveTotpItem() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final issuer = _issuerController.text.trim();
      final secret = _secretController.text.trim().replaceAll(' ', '').toUpperCase();
      
      final item = TotpItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        secret: secret,
        issuer: issuer,
      );

      await StorageService.addTotpItem(item);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text(AppLocalizations.of(context)!.addAuth),
=======
        title: Text('2FA認証を追加'),
>>>>>>> 5d38d1d11d3970eae38942a087a906bdd4787f7d
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _issuerController,
                decoration: InputDecoration(
<<<<<<< HEAD
                  labelText: AppLocalizations.of(context)!.serviceName,
                  hintText: AppLocalizations.of(context)!.serviceNameHint,
                  border: OutlineInputBorder(),
                  helperText: AppLocalizations.of(context)!.serviceNameHelper,
=======
                  labelText: 'サービス名',
                  hintText: '例：Google, GitHub, Microsoft',
                  border: OutlineInputBorder(),
                  helperText: 'サービス名またはアカウント名のどちらか一つは入力してください',
>>>>>>> 5d38d1d11d3970eae38942a087a906bdd4787f7d
                ),
                validator: (value) {
                  final nameValue = _nameController.text.trim();
                  final issuerValue = value?.trim() ?? '';
                  if (nameValue.isEmpty && issuerValue.isEmpty) {
<<<<<<< HEAD
                    return AppLocalizations.of(context)!.serviceOrAccountRequired;
=======
                    return 'サービス名またはアカウント名のどちらか一つは必要です';
>>>>>>> 5d38d1d11d3970eae38942a087a906bdd4787f7d
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
<<<<<<< HEAD
                  labelText: AppLocalizations.of(context)!.accountName,
                  hintText: AppLocalizations.of(context)!.accountNameHint,
=======
                  labelText: 'アカウント名（オプション）',
                  hintText: '例：john@example.com',
>>>>>>> 5d38d1d11d3970eae38942a087a906bdd4787f7d
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final nameValue = value?.trim() ?? '';
                  final issuerValue = _issuerController.text.trim();
                  if (nameValue.isEmpty && issuerValue.isEmpty) {
<<<<<<< HEAD
                    return AppLocalizations.of(context)!.serviceOrAccountRequired;
=======
                    return 'サービス名またはアカウント名のどちらか一つは必要です';
>>>>>>> 5d38d1d11d3970eae38942a087a906bdd4787f7d
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _secretController,
                decoration: InputDecoration(
<<<<<<< HEAD
                  labelText: AppLocalizations.of(context)!.secretKey,
                  hintText: AppLocalizations.of(context)!.secretKeyHint,
=======
                  labelText: 'シークレットキー *',
                  hintText: '32桁Base32シークレットキーを入力',
>>>>>>> 5d38d1d11d3970eae38942a087a906bdd4787f7d
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
<<<<<<< HEAD
                    return AppLocalizations.of(context)!.secretKeyRequired;
                  }
                  final cleanSecret = value.trim().replaceAll(' ', '');
                  if (cleanSecret.length < 16) {
                    return AppLocalizations.of(context)!.secretKeyMinLength;
=======
                    return 'シークレットキーを入力してください';
                  }
                  final cleanSecret = value.trim().replaceAll(' ', '');
                  if (cleanSecret.length < 16) {
                    return 'シークレットキーは最低16桁必要です';
>>>>>>> 5d38d1d11d3970eae38942a087a906bdd4787f7d
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveTotpItem,
<<<<<<< HEAD
                  child: Text(AppLocalizations.of(context)!.add),
=======
                  child: Text('追加'),
>>>>>>> 5d38d1d11d3970eae38942a087a906bdd4787f7d
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}