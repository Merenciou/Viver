// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:viver/screens/sleep.dart';
// import 'package:viver/user_controller/user_controller.dart';

// class Teste extends StatefulWidget {
//   const Teste({super.key});

//   @override
//   State<Teste> createState() => _TesteState();
// }

// class _TesteState extends State<Teste> {
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   List<dynamic> hourToSleep = [];

//   Future<void> loadJsonList() async {
//     String jsonString = await DefaultAssetBundle.of(context)
//         .loadString('lib/assets/json_list_info/list.json');
//     Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

//     List<dynamic> hourToSleepList = jsonResponse['hourtosleep'];

//     setState(() {
//       hourToSleep = hourToSleepList;
//     });
//   }

//   void getIdealHour() {
//     double? age = UserController().age;

//     switch (age!) {
//       case >= 0.01 && <= 0.03:
//         setState(() {
//           Sleep(hourIdealMin: hourToSleep[0]['0at0.3'][0]);
//           Sleep(hourIdealMax: hourToSleep[0]['0at0.3'][1]);
//         });
//         break;
//       case >= 0.04 && <= 0.11:
//         setState(() {
//           Sleep(hourIdealMin: hourToSleep[1]['0.4at0.11'][0]);
//           Sleep(hourIdealMax: hourToSleep[1]['0.4at0.11'][1]);
//         });
//         break;
//       case >= 1 && <= 2:
//         setState(() {
//           Sleep(hourIdealMin: hourToSleep[2]['1at2'][0]);
//           Sleep(hourIdealMax: hourToSleep[2]['1at2'][1]);
//         });
//         break;
//       case >= 3 && <= 5:
//         setState(() {
//           Sleep(hourIdealMin: hourToSleep[3]['3at5'][0]);
//           Sleep(hourIdealMax: hourToSleep[3]['3at5'][1]);
//         });
//         break;
//       case >= 6 && <= 12:
//         setState(() {
//           Sleep(hourIdealMin: hourToSleep[4]['6at12'][0]);
//           Sleep(hourIdealMax: hourToSleep[4]['6at12'][1]);
//         });
//         break;
//       case >= 13 && <= 18:
//         setState(() {
//           Sleep(hourIdealMin: hourToSleep[5]['13at18'][0]);
//           Sleep(hourIdealMax: hourToSleep[5]['13at18'][1]);
//         });
//         break;
//       case >= 19 && <= 60:
//         Sleep(hourIdealMin: hourToSleep[6]['19at60'][0]);
//         Sleep(hourIdealMax: hourToSleep[6]['19at60'][1]);

//         break;
//       case >= 61 && <= 64:
//         setState(() {
//           Sleep(hourIdealMin: hourToSleep[7]['61at64'][0]);
//           Sleep(hourIdealMax: hourToSleep[7]['61at64'][1]);
//         });
//         break;
//       case >= 65:
//         setState(() {
//           Sleep(hourIdealMin: hourToSleep[8]['65orMore'][0]);
//           Sleep(hourIdealMax: hourToSleep[8]['65orMore'][1]);
//         });
//         break;
//       default:
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Form(
//               key: formKey,
//               child: TextFormField(
//                 decoration: const InputDecoration(
//                   filled: true,
//                   fillColor: Colors.orange,
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   getIdealHour();
//                 },
//                 child: const Text('Enviar'))
//           ],
//         ),
//       ),
//     );
//   }
// }
