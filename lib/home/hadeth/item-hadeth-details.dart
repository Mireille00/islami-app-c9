import 'package:flutter/material.dart';
import 'package:islami/providers/app-config-provider.dart';
import 'package:provider/provider.dart';

class ItemHadethDetails extends StatelessWidget {
  late String content;

  ItemHadethDetails({required this.content});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Text(
      content,
      style: Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
