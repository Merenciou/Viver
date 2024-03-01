import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:audioplayers/audioplayers.dart';

class BreathePage extends StatefulWidget {
  const BreathePage({super.key});

  @override
  State<BreathePage> createState() => _BreathePage();
}

class _BreathePage extends State<BreathePage> {
  Future<void> playAudio() async {
    final player = AudioPlayer();
    await player.play(AssetSource('ambience.mp3'));
  }

  Future<void> speak(String text, double pitch) async {
    FlutterTts flutterTts = FlutterTts();
    await flutterTts.setLanguage('pt-BR');
    await flutterTts.setVoice({
      'name': 'pt-br-x-ptd-network',
      'locale': 'pt-BR',
    });
    await flutterTts.setSpeechRate(pitch);
    await flutterTts.speak(text);
  }

  List<Widget> screensList(BuildContext context) {
    return [
      firstStepBreathe(),
      secondStepBreathe(),
      startBreatheButton(),
      startBreathe(),
    ];
  }

  int screensIndex = 0;
  bool isStarted = false;
  var changeFillColor = const Color(0XFF79AC78).withOpacity(0.5);
  var changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
  var changedText = 'Inspire';
  double changedWidth = 10;
  int counterInitial = 0;
  int counter = 0;

  void changeDetails() {
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
        changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
        changedText = 'Inspire';
        speak('Inspire profundamente', 0.40);
        timer.cancel();
      });
    });

    Timer.periodic(const Duration(seconds: 6), (timer) {
      setState(() {
        changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
        changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
        changedText = 'Segure o ar';
        speak('Segure o ar', 0.40);
        timer.cancel();
      });
    });

    Timer.periodic(const Duration(seconds: 12), (timer) {
      setState(() {
        changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
        changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
        changedText = 'Expire';
        speak('Expire pelo nariz lentamente', 0.40);
        timer.cancel();
      });
    });

    Timer.periodic(const Duration(seconds: 18), (timer) {
      setState(() {
        changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
        changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
        changedText = 'Segure sem ar';
        speak('Segure sem ar por alguns segundos', 0.40);
        timer.cancel();
      });
    });

    // Segunda Volta

    Timer.periodic(const Duration(seconds: 24), (timer) {
      setState(() {
        changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
        changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
        changedText = 'Inspire';
        speak('Inspire profundamente', 0.40);
        timer.cancel();
      });
    });

    Timer.periodic(const Duration(seconds: 30), (timer) {
      setState(() {
        changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
        changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
        changedText = 'Segure o ar';
        speak('Segure o ar', 0.40);
        timer.cancel();
      });
    });

    Timer.periodic(const Duration(seconds: 36), (timer) {
      setState(() {
        changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
        changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
        changedText = 'Expire';
        speak('Expire pelo nariz lentamente', 0.40);
        timer.cancel();
      });
    });

    Timer.periodic(const Duration(seconds: 42), (timer) {
      setState(() {
        changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
        changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
        changedText = 'Segure sem ar';
        speak('Segure sem ar por alguns segundos', 0.40);
        timer.cancel();
      });
    });

    // Terceira Volta

    Timer.periodic(const Duration(seconds: 48), (timer) {
      setState(() {
        changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
        changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
        changedText = 'Inspire';
        speak('Inspire profundamente', 0.40);
        timer.cancel();
      });
    });

    Timer.periodic(const Duration(seconds: 54), (timer) {
      setState(() {
        changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
        changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
        changedText = 'Segure o ar';
        speak('Segure o ar', 0.40);
        timer.cancel();
      });
    });

    Timer.periodic(const Duration(seconds: 60), (timer) {
      setState(() {
        changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
        changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
        changedText = 'Expire';
        speak('Expire pelo nariz lentamente', 0.40);
        timer.cancel();
      });
    });

    Timer.periodic(const Duration(seconds: 66), (timer) {
      setState(() {
        changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
        changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
        changedText = 'Segure sem ar';
        speak('Segure sem ar por alguns segundos', 0.40);
        timer.cancel();
      });
    });

    // Quarta Volta

    Timer.periodic(const Duration(seconds: 24), (timer) {
      setState(() {
        changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
        changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
        changedText = 'Inspire';
        speak('Inspire profundamente', 0.40);
        timer.cancel();
      });
    });

    Timer.periodic(const Duration(seconds: 30), (timer) {
      setState(() {
        changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
        changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
        changedText = 'Segure o ar';
        speak('Segure o ar', 0.40);
        timer.cancel();
      });
    });

    Timer.periodic(const Duration(seconds: 36), (timer) {
      setState(() {
        changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
        changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
        changedText = 'Expire';
        speak('Expire pelo nariz lentamente', 0.40);
        timer.cancel();
      });
    });

    Timer.periodic(const Duration(seconds: 42), (timer) {
      setState(() {
        changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
        changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
        changedText = 'Segure sem ar';
        speak('Segure sem ar por alguns segundos', 0.40);
        timer.cancel();
      });
    });

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counterInitial < 5) {
        setState(() {
          counter = counterInitial++;
        });
      } else {
        setState(() {
          counterInitial = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 65),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return screensList(context)[screensIndex];
              })),
    );
  }

  Widget firstStepBreathe() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: SvgPicture.asset('lib/assets/images/place.svg'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Text(
              'Encontre um lugar\n tranquilo e\n silencioso...',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontSize: 29),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
                onPressed: () {
                  setState(() {
                    screensIndex = 1;
                  });
                },
                child: Text(
                  'Continuar',
                  style: GoogleFonts.montserrat(
                      color: Colors.black54, fontSize: 20),
                )),
          )
        ],
      ),
    );
  }

  Widget secondStepBreathe() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: SvgPicture.asset('lib/assets/images/breathe.svg'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Text(
              'Sente-se ou deite-se, se acomode como preferir...',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(fontSize: 29),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        screensIndex = 0;
                      });
                    },
                    child: Text(
                      'Voltar',
                      style: GoogleFonts.montserrat(
                          color: Colors.black54, fontSize: 20),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        screensIndex = 2;
                      });
                    },
                    child: Text(
                      'Continuar',
                      style: GoogleFonts.montserrat(
                          color: Colors.black54, fontSize: 20),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget startBreatheButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isStarted = true;
            screensIndex = 3;
          });
          playAudio();
          changeDetails();
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            minimumSize: const Size(250, 250),
            backgroundColor: Theme.of(context).colorScheme.primaryContainer),
        child: Text(
          'Iniciar',
          style: GoogleFonts.montserrat(fontSize: 30),
        ),
      ),
    );
  }

  Widget startBreathe() {
    return Center(
      child: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 4),
            width: 250,
            height: 250,
            decoration: BoxDecoration(
                color: changeFillColor,
                borderRadius: const BorderRadius.all(Radius.circular(150)),
                border:
                    Border.all(color: changeWidthColor, width: changedWidth)),
            child: Center(
              child: Animate(
                effects: const [
                  FadeEffect(delay: Duration(milliseconds: 1000))
                ],
                child: Text(
                  changedText,
                  style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            left: 105,
            top: 20,
            child: Text(
              '$counter',
              style:
                  GoogleFonts.montserrat(fontSize: 60, color: Colors.white38),
            ),
          ),
        ],
      ),
    );
  }
}
