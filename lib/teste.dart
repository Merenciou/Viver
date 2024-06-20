// // // import 'package:flutter/material.dart';
// // // import 'package:viver/controllers/user_model.dart';

// // // class Teste extends StatefulWidget {
// // //   const Teste({super.key});

// // //   @override
// // //   State<Teste> createState() => _TesteState();
// // // }

// // // class _TesteState extends State<Teste> {
// // //   late Future<String?> nameFuture;
// // //   @override
// // //   void initState() {
// // //     nameFuture = UserModel().getName();
// // //     super.initState();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       body: Center(
// // //         child: FutureBuilder(
// // //             future: nameFuture,
// // //             builder:
// // //                 (BuildContext context, AsyncSnapshot<String?> asyncSnapshot) {
// // //               if (asyncSnapshot.connectionState == ConnectionState.done) {
// // //                 if (asyncSnapshot.hasData) {
// // //                   return Text(asyncSnapshot.data!);
// // //                 } else {
// // //                   return Text('${asyncSnapshot.error}');
// // //                 }
// // //               } else {
// // //                 return const CircularProgressIndicator();
// // //               }
// // //             }),
// // //       ),
// // //     );
// // //   }
// // // }

// // // countdown_timer.dart
// // import 'package:flutter/material.dart';
// // import 'dart:async';

// // class Teste extends StatefulWidget {
// //   const Teste({super.key});

// //   @override
// //   TesteState createState() => TesteState();
// // }

// // class TesteState extends State<Teste> {
// //   late Timer timer;
// //   late int totalSeconds;

// //   @override
// //   void initState() {
// //     super.initState();
// //     startCountdown(3600); // 1 hour in seconds
// //   }

// //   void startCountdown(int seconds) {
// //     totalSeconds = seconds;
// //     updateCounter();

// //     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
// //       totalSeconds--;
// //       updateCounter();

// //       if (totalSeconds <= 0) {
// //         timer.cancel();
// //       }
// //     });
// //   }

// //   void updateCounter() {
// //     String minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
// //     String seconds = (totalSeconds % 60).toString().padLeft(2, '0');

// //     String counterText = '$minutes:$seconds';

// //     setState(() {
// //       // Atualize o Texto com o valor de 'counterText'
// //       _counterText = counterText;
// //     });
// //   }

// //   String _counterText = '';

// //   @override
// //   Widget build(BuildContext context) {
// //     return Text('tempo restante: $_counterText');
// //   }
// // }

// import 'package:flutter/material.dart';

// class Teste extends StatefulWidget {
//   const Teste({super.key});

//   @override
//   State<Teste> createState() => _TesteState();
// }

// class _TesteState extends State<Teste> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () {
//               Navigator.of(context).pushNamed('/sleeppage');
//             },
//             child: const Text('Direcionar')),
//       ),
//     );
//   }
// }
