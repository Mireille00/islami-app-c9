import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  static const String routeName = 'sebha-tab';

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double turns = 0.0;
  int counter = 0;

  String Textholder = 'سبحان الله';

  void clickedFunction() {
    setState(() {
      Textholder = 'الحمد لله';
    });
  }

  @override
  Widget build(BuildContext context) {
    var $counter = 0;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  clickedFunction;
                  setState(() {
                    turns += 1 / 4;
                    counter++;
                  });
                },
                child: AnimatedRotation(
                  turns: turns,
                  duration: Duration(seconds: 1),
                  child: Image.asset('assets/images/Group 9.png'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'عدد التسبيحات',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Container(
                width: 70,
                height: 40,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    '30',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  Textholder,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
