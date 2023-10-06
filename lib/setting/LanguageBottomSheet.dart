import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app-config-provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            provider.changeLanguage('en');
          },
          child: provider.appLanguage == 'en'
              ? getSelectedItem(AppLocalizations.of(context)!.english)
              : getUnSelectedItem(AppLocalizations.of(context)!.english),
        ),
        InkWell(
          onTap: () {
            provider.changeLanguage('ar');
          },
          child: provider.appLanguage == 'ar'
              ? getSelectedItem(AppLocalizations.of(context)!.arabic)
              : getUnSelectedItem(AppLocalizations.of(context)!.arabic),
        ),
      ],
    );
  }

  Widget getSelectedItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }

  Widget getUnSelectedItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
