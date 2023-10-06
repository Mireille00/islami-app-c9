import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/home/hadeth/item-hadeth-name.dart';
import 'package:provider/provider.dart';

import '../../my-theme.dart';
import '../../providers/app-config-provider.dart';

class HadethTab extends StatefulWidget {
  static const String routeName = 'hadeth-tab';

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethlist = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    if (ahadethlist.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Center(child: Image.asset('assets/images/hadeth-image.png')),
        Divider(
          color: provider.isDarkMode()
              ? Mytheme.yellowColor
              : Theme.of(context).primaryColor,
          thickness: 3,
        ),
        Text(
          AppLocalizations.of(context)!.hadeth_name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Divider(
          color: provider.isDarkMode()
              ? Mytheme.yellowColor
              : Theme.of(context).primaryColor,
          thickness: 3,
        ),
        ahadethlist.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ))
            : Expanded(
                child: ListView.separated(
                  separatorBuilder: ((context, index) {
                    return Divider(
                      color: provider.isDarkMode()
                          ? Mytheme.yellowColor
                          : Theme.of(context).primaryColor,
                      thickness: 1,
                    );
                  }),
                  itemBuilder: (context, index) {
                    return ItemHadethName(
                      hadeth: ahadethlist[index],
                    );
                  },
                  itemCount: ahadethlist.length,
                ),
              ),
      ],
    );
  }

  void loadHadethFile() async {
    String ahadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethList = ahadethContent.split('#\r\n');
    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadethLines = hadethList[i].split('\n');
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(content: hadethLines, title: title);
      ahadethlist.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;
  List<String> content;

  Hadeth({required this.content, required this.title});
}
