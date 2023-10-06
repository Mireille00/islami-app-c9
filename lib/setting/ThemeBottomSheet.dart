import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/providers/app-config-provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () {
            provider.changeTheme(ThemeMode.light);
          },
          child: provider.isDarkMode()
              ? getUnSelectedItem(AppLocalizations.of(context)!.light)
              : getSelectedItem(AppLocalizations.of(context)!.light),
        ),
        InkWell(
          onTap: () {
            provider.changeTheme(ThemeMode.dark);
          },
          child: provider.isDarkMode()
              ? getSelectedItem(AppLocalizations.of(context)!.dark)
              : getUnSelectedItem(AppLocalizations.of(context)!.dark),
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
