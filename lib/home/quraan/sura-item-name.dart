import 'package:flutter/material.dart';
import 'package:islami/home/quraan/sura-details-screen.dart';
import 'package:provider/provider.dart';

import '../../providers/app-config-provider.dart';

class SuraItemName extends StatelessWidget {
  late String name;
  int index;

  SuraItemName({required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          SuraDetailesScreen.routeName,
          arguments: SuraDetailsArgs(name: name, index: index),
        );
      },
      child: Text(
        name,
        style: provider.isDarkMode()
            ? Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.white,
                )
            : Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
