import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/hadeth-details-screen.dart';
import 'package:islami/my-theme.dart';
import 'package:provider/provider.dart';

import '../../providers/app-config-provider.dart';
import 'hadeth-tab.dart';

class ItemHadethName extends StatelessWidget {
  Hadeth hadeth;

  ItemHadethName({required this.hadeth});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HadethDetailesScreen.routeName, arguments: hadeth);
      },
      child: Text(
        hadeth.title,
        style: provider.isDarkMode()
            ? Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Mytheme.whitecolor)
            : Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    );
  }
}
