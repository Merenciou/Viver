import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var text = 'texto inicial';

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  bool stopRepetitions = false;

  @override
  void initState() {
    changeText();
    super.initState();
  }

  void changeText() async {
    int repetitions = 0;

    while (repetitions < 5) {
      if (stopRepetitions) {
        break;
      }
      await Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          text = 'texto 1';
        });
      });
      await Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          text = 'texto 2';
        });
      });
      await Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          text = 'texto 3';
        });
      });
      await Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          text = 'texto 4';
        });
      });

      repetitions++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    stopRepetitions = true;
                  });
                },
                child: Text(
                  'Parar',
                  style: GoogleFonts.montserrat(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
