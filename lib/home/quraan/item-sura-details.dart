import 'package:flutter/material.dart';

class ItemSuraDtails extends StatelessWidget {
  late String content;
  int index;

  ItemSuraDtails({required this.content, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$content{${index + 1}}',
      style: Theme.of(context).textTheme.titleSmall,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
