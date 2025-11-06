import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
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
        title: Text(AppLocalizations.of(context)!.addAuth),
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
                  labelText: AppLocalizations.of(context)!.serviceName,
                  hintText: AppLocalizations.of(context)!.serviceNameHint,
                  border: OutlineInputBorder(),
                  helperText: AppLocalizations.of(context)!.serviceNameHelper,
                ),
                validator: (value) {
                  final nameValue = _nameController.text.trim();
                  final issuerValue = value?.trim() ?? '';
                  if (nameValue.isEmpty && issuerValue.isEmpty) {
                    return AppLocalizations.of(context)!.serviceOrAccountRequired;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.accountName,
                  hintText: AppLocalizations.of(context)!.accountNameHint,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final nameValue = value?.trim() ?? '';
                  final issuerValue = _issuerController.text.trim();
                  if (nameValue.isEmpty && issuerValue.isEmpty) {
                    return AppLocalizations.of(context)!.serviceOrAccountRequired;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _secretController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.secretKey,
                  hintText: AppLocalizations.of(context)!.secretKeyHint,
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return AppLocalizations.of(context)!.secretKeyRequired;
              }
              final cleanSecret = value.trim().replaceAll(' ', '').toUpperCase();
              // Minimum length and Base32 character set validation (A-Z, 2-7, optional padding '=')
              if (cleanSecret.length < 16) {
                return AppLocalizations.of(context)!.secretKeyMinLength;
              }
              final base32Re = RegExp(r'^[A-Z2-7]+=*$');
              if (!base32Re.hasMatch(cleanSecret)) {
                return AppLocalizations.of(context)!.secretKeyInvalid;
              }
              return null;
            },
          ),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _saveTotpItem,
                  child: Text(AppLocalizations.of(context)!.add),
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
