import 'package:flutter/material.dart';

class RadioTab extends StatelessWidget {
  static const String routeName = 'radio-tab';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 100),
            child: Image.asset('assets/images/radio_image.png')),
        Text(
          'إذاعة القرآن الكريم',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
        ),
        Container(
            margin: EdgeInsets.only(top: 60),
            child: Image.asset('assets/images/playback.png')),
      ],
    ));
  }
}
