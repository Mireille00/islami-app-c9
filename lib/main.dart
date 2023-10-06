import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/hadeth/hadeth-details-screen.dart';
import 'package:islami/home/home-screen.dart';
import 'package:islami/home/quraan/sura-details-screen.dart';
import 'package:islami/home/radio/radio-tab.dart';
import 'package:islami/my-theme.dart';
import 'package:islami/providers/app-config-provider.dart';
import 'package:islami/setting/settings.dart';
import 'package:provider/provider.dart';

import 'home/hadeth/hadeth-tab.dart';
import 'home/sebha/sebha-tab.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailesScreen.routeName: (context) => SuraDetailesScreen(),
        HadethTab.routeName: (context) => HadethTab(),
        RadioTab.routeName: (context) => RadioTab(),
        SebhaTab.routeName: (context) => SebhaTab(),
        HadethDetailesScreen.routeName: (context) => HadethDetailesScreen(),
        SettingsTab.routeName: (context) => SettingsTab(),
      },
      theme: Mytheme.LightTheme,
      darkTheme: Mytheme.DarkTheme,
      themeMode: provider.appTheme,
      locale: Locale(provider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
