import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../my-theme.dart';
import '../../providers/app-config-provider.dart';

class Sebhatab extends StatefulWidget {
  static const String routeName = 'sebha-tab';

  @override
  State<Sebhatab> createState() => _SebhatabState();
}

class _SebhatabState extends State<Sebhatab> {
  double turns = 0;
  int number = 0;
  int counter = 1;
  int azkarCounter=0;
  double angle=0;
//
  String displayText = 'سبحان الله';
  var string = ['الحمد لله', 'اعوذ بالله', 'استغفر الله'];

  void changeText() {
    setState(() {
      displayText = string[Random().nextInt(string.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (number == 33 || number == 66 || number == 99) {
              changeText();
            }
            setState(() {
              turns += 1 / 4;
              counter++;
            });
          },
          child: AnimatedRotation(
            turns: turns,
            duration: Duration(seconds: 1),
            child: Image.asset(
              'assets/images/Group 9.png',
              height: 300,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          AppLocalizations.of(context)?.tasbeeh??"",
          style: provider.isDarkMode()
              ? Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Mytheme.whitecolor)
              : Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    color: Color(0xffC8B396),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    counter.toString(),
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Mytheme.whitecolor),
                  ),
                )),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  TasbeehLogic();
                },
                style:ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: provider.isDarkMode()
                      ? Mytheme.primarycolor
                      : Theme.of(context).primaryColor,

                ),

                child: Text(
                  displayText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
  void TasbeehLogic(){
    if(counter==33){
      counter=1;
      if(azkarCounter==3){
        azkarCounter=0;
      }else{
        azkarCounter++;
      }
    }else {
      counter++;
    }
    setState(() {});
  }
}


