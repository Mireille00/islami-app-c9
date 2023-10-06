import 'package:flutter/material.dart';
import 'package:islami/home/hadeth/item-hadeth-details.dart';
import 'package:provider/provider.dart';

import '../../providers/app-config-provider.dart';
import 'hadeth-tab.dart';

class HadethDetailesScreen extends StatefulWidget {
  static const String routeName = 'hadeth-details-name';

  @override
  State<HadethDetailesScreen> createState() => _HadethDetailesScreenState();
}

class _HadethDetailesScreenState extends State<HadethDetailesScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return Stack(children: [
      provider.isDarkMode()
          ? Image.asset(
              'assets/images/bg.dark.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            )
          : Image.asset(
              'assets/images/main_background.png',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            args.title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.06,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ItemHadethDetails(content: args.content[index]);
            },
            itemCount: args.content.length,
          ),
        ),
      ),
    ]);
  }
}
