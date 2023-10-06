// class Sebhatab extends StatefulWidget {
//   @override
//   State<Sebhatab> createState() => _SebhatabState();
// }
//
// class _SebhatabState extends State<Sebhatab> {
//   double turns = 0;
//   int number = 0;
//   String displayText = 'سبحان الله';
//   var string = ['الحمد لله', 'اعوذ بالله', 'استغفر الله'];
//
//   void changeText() {
//     setState(() {
//       displayText = string[Random().nextInt(string.length)];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<AppConfigProvider>(context);
//     return Column(
//         children: [
//           InkWell(
//             onTap: () {
//               if (number == 33 || number == 66 || number == 99) {
//                 changeText();
//               }
//               setState(() {
//                 turns += 1 / 4;
//                 number++;
//               });
//             },
//             child: AnimatedRotation(
//               turns: turns,
//               duration: Duration(seconds: 1),
//               child: Image.asset(
//                 'assets/images/sebha_image.png',
//                 height: 300,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             'عدد التسبيحات',
//             style: provider.isDarkMode()
//                 ? Theme.of(context)
//                 .textTheme
//                 .titleSmall!
//                 .copyWith(color: MyTheme.whiteColor)
//                 : Theme.of(context).textTheme.titleMedium,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                   decoration: BoxDecoration(
//                       color: Color(0xffC8B396),
//                       borderRadius: BorderRadius.circular(30)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       number.toString(),
//                       style: Theme.of(context).textTheme.titleSmall,
//                     ),
//                   )),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                     color: Color(0xffB7935F),
//                     borderRadius: BorderRadius.circular(30)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     displayText,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 25,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           )
//
// }
