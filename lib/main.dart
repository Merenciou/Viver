import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viver/mainpage.dart';
import 'package:viver/presentation.dart';
import 'package:viver/sign.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color(0xFFD2E0FB)));
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _Main();
}

class _Main extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/presentation': (context) => const Presentation(),
          '/homepage': (context) => const MainPage(),
        },
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFFC4DFDF),
                primary: const Color(0xFFD2E0FB),
                secondary: const Color(0XFF79AC78),
                tertiary: const Color(0xFFF8F6F4),
                primaryContainer: const Color(0xFF40A2E3),
                secondaryContainer: const Color(0xFF79AC78))),
        home: const Sign(),
      ),
    );
  }
}
