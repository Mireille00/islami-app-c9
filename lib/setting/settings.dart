import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app-config-provider.dart';
import 'package:islami/setting/LanguageBottomSheet.dart';
import 'package:provider/provider.dart';

import 'ThemeBottomSheet.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'settings-tab';

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                showThemeButtomSheet();
              },
              child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.isDarkMode()
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                showLanguageButtomSheet();
              },
              child: Container(
                padding: EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      provider.appLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showThemeButtomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }

  void showLanguageButtomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }
}
