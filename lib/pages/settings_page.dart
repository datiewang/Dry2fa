import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../services/locale_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
      ),
      backgroundColor: Colors.grey[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.language_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          AppLocalizations.of(context)!.language,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Consumer<LocaleService>(
                      builder: (context, localeService, child) {
                        return Column(
                          children: LocaleService.supportedLocales
                              .map((locale) => RadioListTile<Locale>(
                                    title: Text(LocaleService.localeNames[locale.languageCode]!),
                                    subtitle: Text(_getLocaleDisplayName(context, locale)),
                                    value: locale,
                                    groupValue: localeService.locale ?? 
                                        Localizations.localeOf(context),
                                    onChanged: (Locale? value) {
                                      if (value != null) {
                                        localeService.setLocale(value);
                                      }
                                    },
                                    contentPadding: EdgeInsets.zero,
                                  ))
                              .toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          AppLocalizations.of(context)!.about,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.of(context)!.appDescription,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      AppLocalizations.of(context)!.version('1.0.0'),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getLocaleDisplayName(BuildContext context, Locale locale) {
    switch (locale.languageCode) {
      case 'zh':
        return AppLocalizations.of(context)!.languageChineseDesc;
      case 'ja':
        return AppLocalizations.of(context)!.languageJapaneseDesc;
      case 'en':
        return AppLocalizations.of(context)!.languageEnglishDesc;
      default:
        return '';
    }
  }
}
