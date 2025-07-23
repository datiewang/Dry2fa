import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'services/locale_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleService(),
      child: Consumer<LocaleService>(
        builder: (context, localeService, child) {
          return MaterialApp(
            title: 'Flutter 2FA Manager',
            onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: LocaleService.supportedLocales,
            locale: localeService.locale,
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              // 如果用户已选择语言，使用用户选择
              if (localeService.locale != null) {
                return localeService.locale;
              }
              
              // 根据系统语言自动选择
              if (deviceLocale != null) {
                for (var supportedLocale in supportedLocales) {
                  if (supportedLocale.languageCode == deviceLocale.languageCode) {
                    return supportedLocale;
                  }
                }
              }
              
              // 默认使用中文
              return const Locale('zh');
            },
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF6366F1),
                brightness: Brightness.light,
              ),
              useMaterial3: true,
              cardTheme: CardTheme(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                    color: Colors.grey.withValues(alpha: 0.1),
                    width: 1,
                  ),
                ),
              ),
              appBarTheme: const AppBarTheme(
                elevation: 0,
                scrolledUnderElevation: 0,
                centerTitle: true,
              ),
            ),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

