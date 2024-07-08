// ADICIONAR PARADA QUANDO ALTERAR PAGINAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
// if (buttonIndex != 1) {
//   BreathePage();
// }

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
  final player = AudioPlayer();
  dynamic statePlayer;

  Future<void> playAudio() async {
    player.setVolume(1);

    setState(() {
      statePlayer = player.play(AssetSource('ambience.mp3'));
    });
  }

  Future<void> stopAudio() async {
    setState(() {
      statePlayer = player.stop();
    });
  }

  Future<void> speak(String text, double pitch) async {
    FlutterTts flutterTts = FlutterTts();
    await flutterTts.setVolume(0.5);
    await flutterTts.setLanguage('pt-BR');
    await flutterTts.setSpeechRate(pitch);
    await flutterTts.speak(text);
    Map<String, String> voiceSettings = {
      'name': 'pt-br-x-ptd-network',
      'locale': 'pt-BR',
    };

    await flutterTts.setVoice(voiceSettings);
  }

  List<Widget> screensList(BuildContext context) {
    return [
      firstStepBreathe(),
      secondStepBreathe(),
      thirdStepBreathe(),
      startBreatheButton(),
      startBreathe(),
    ];
  }

  int screensIndex = 0;
  bool isStarted = false;
  var changeFillColor = const Color(0XFF79AC78).withOpacity(0.5);
  var changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
  var changedText = 'Prepare-se';
  double changedWidth = 10;

  bool stopCounter = false;

  dynamic timer0;
  dynamic timer1;
  dynamic timer2;
  dynamic timer3;
  dynamic timer4;
  dynamic timer5;
  dynamic timer6;
  dynamic timer7;
  dynamic timer8;
  dynamic timer9;
  dynamic timer10;
  dynamic timer11;
  dynamic timer12;
  dynamic timer13;
  dynamic timer14;
  dynamic timer15;
  dynamic timer16;
  dynamic timer17;
  dynamic timer18;
  dynamic timer19;

  @override
  void dispose() {
    timer0?.cancel();
    timer1?.cancel();
    timer2?.cancel();
    timer3?.cancel();
    timer4?.cancel();
    timer5?.cancel();
    timer6?.cancel();
    timer7?.cancel();
    timer8?.cancel();
    timer9?.cancel();
    timer10?.cancel();
    timer11?.cancel();
    timer12?.cancel();
    timer13?.cancel();
    timer14?.cancel();
    timer15?.cancel();
    timer16?.cancel();
    timer17?.cancel();
    timer18?.cancel();
    timer19?.cancel();
    startBreathe();
    super.dispose();
  }

  void changeDetails() {
    if (mounted) {
      Timer(const Duration(milliseconds: 500), () {
        playAudio();
      });

      Future.delayed(const Duration(seconds: 5), () {
        for (int i = 0; i < 20; i++) {
          if (stopCounter == true) {
            break;
          }

          switch (i) {
            case 0:
              setState(() {
                timer0 = Timer(const Duration(seconds: 3), () {
                  setState(() {
                    changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
                    changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
                    changedText = 'Inspire';
                    speak('Inspire profundamente', 0.30);
                  });
                });
              });

              break;
            case 1:
              setState(() {
                timer1 = Timer(const Duration(seconds: 8), () {
                  setState(() {
                    changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
                    changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
                    changedText = 'Segure o ar';
                    speak('Segure o ar', 0.30);
                  });
                });
              });

              break;
            case 2:
              setState(() {
                timer2 = Timer(const Duration(seconds: 13), () {
                  setState(() {
                    changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
                    changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
                    changedText = 'Expire';
                    speak('Expire pelo nariz lentamente', 0.30);
                  });
                });
              });

              break;
            case 3:
              setState(() {
                timer3 = Timer(const Duration(seconds: 18), () {
                  setState(() {
                    changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
                    changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
                    changedText = 'Segure sem ar';
                    speak('Segure sem ar por alguns segundos', 0.30);
                  });
                });
              });

              break;
            case 4:
              setState(() {
                timer4 = Timer(const Duration(seconds: 23), () {
                  setState(() {
                    changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
                    changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
                    changedText = 'Inspire';
                    speak('Inspire profundamente', 0.30);
                  });
                });
              });

              break;
            case 5:
              setState(() {
                timer5 = Timer(const Duration(seconds: 28), () {
                  setState(() {
                    changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
                    changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
                    changedText = 'Segure o ar';
                    speak('Segure o ar', 0.30);
                  });
                });
              });

              break;
            case 6:
              setState(() {
                timer6 = Timer(const Duration(seconds: 33), () {
                  setState(() {
                    changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
                    changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
                    changedText = 'Expire';
                    speak('Expire pelo nariz lentamente', 0.30);
                  });
                });
              });

              break;
            case 7:
              setState(() {
                timer7 = Timer(const Duration(seconds: 38), () {
                  setState(() {
                    changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
                    changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
                    changedText = 'Segure sem ar';
                    speak('Segure sem ar por alguns segundos', 0.30);
                  });
                });
              });

              break;
            case 8:
              timer8 = Timer(const Duration(seconds: 43), () {
                setState(() {
                  changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
                  changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
                  changedText = 'Inspire';
                  speak('Inspire profundamente', 0.30);
                });
              });

              break;
            case 9:
              setState(() {
                timer9 = Timer(const Duration(seconds: 48), () {
                  setState(() {
                    changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
                    changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
                    changedText = 'Segure o ar';
                    speak('Segure o ar', 0.30);
                  });
                });
              });

              break;
            case 10:
              setState(() {
                timer10 = Timer(const Duration(seconds: 53), () {
                  setState(() {
                    changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
                    changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
                    changedText = 'Expire';
                    speak('Expire pelo nariz lentamente', 0.30);
                  });
                });
              });

              break;
            case 11:
              setState(() {
                timer11 = Timer(const Duration(seconds: 58), () {
                  setState(() {
                    changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
                    changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
                    changedText = 'Segure sem ar';
                    speak('Segure sem ar por alguns segundos', 0.30);
                  });
                });
              });

              break;
            case 12:
              setState(() {
                timer12 = Timer(const Duration(seconds: 63), () {
                  setState(() {
                    changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
                    changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
                    changedText = 'Inspire';
                    speak('Inspire profundamente', 0.30);
                  });
                });
              });

              break;
            case 13:
              setState(() {
                timer13 = Timer(const Duration(seconds: 68), () {
                  setState(() {
                    changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
                    changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
                    changedText = 'Segure o ar';
                    speak('Segure o ar', 0.30);
                  });
                });
              });

              break;
            case 14:
              setState(() {
                timer14 = Timer(const Duration(seconds: 73), () {
                  setState(() {
                    changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
                    changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
                    changedText = 'Expire';
                    speak('Expire pelo nariz lentamente', 0.30);
                  });
                });
              });

              break;
            case 15:
              setState(() {
                timer15 = Timer(const Duration(seconds: 78), () {
                  setState(() {
                    changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
                    changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
                    changedText = 'Segure sem ar';
                    speak('Segure sem ar por alguns segundos', 0.30);
                  });
                });
              });

              break;
            case 16:
              setState(() {
                timer16 = Timer(const Duration(seconds: 83), () {
                  setState(() {
                    changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
                    changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
                    changedText = 'Inspire';
                    speak('Inspire profundamente', 0.30);
                  });
                });
              });

              break;
            case 17:
              setState(() {
                timer17 = Timer(const Duration(seconds: 88), () {
                  setState(() {
                    changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
                    changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
                    changedText = 'Segure o ar';
                    speak('Segure o ar', 0.30);
                  });
                });
              });

              break;
            case 18:
              setState(() {
                timer18 = Timer(const Duration(seconds: 93), () {
                  setState(() {
                    changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
                    changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
                    changedText = 'Expire';
                    speak('Expire pelo nariz lentamente', 0.30);
                  });
                });
              });

              break;
            case 19:
              setState(() {
                timer19 = Timer(const Duration(seconds: 98), () {
                  setState(() {
                    changeFillColor = const Color(0xFFF5DD61).withOpacity(0.7);
                    changeWidthColor = const Color(0xFFF5DD61).withOpacity(0.4);
                    changedText = 'Segure sem ar';
                    speak('Segure sem ar por alguns segundos', 0.30);
                  });
                });
              });

              break;

            default:
          }
        }
      });
    } else {
      stopAudio();
    }
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

  Widget thirdStepBreathe() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: SvgPicture.asset('lib/assets/images/headphones.svg'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Text(
              'Para uma melhor experiência, utilize fones de ouvido...',
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
                        screensIndex = 3;
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
            screensIndex = 4;
            stopCounter = false;
          });

          changeDetails();
        },
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            minimumSize: const Size(250, 250),
            backgroundColor: Theme.of(context).colorScheme.tertiary),
        child: Text(
          'Iniciar',
          style: GoogleFonts.montserrat(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }

  Widget startBreathe() {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 4),
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                    color: changeFillColor,
                    borderRadius: const BorderRadius.all(Radius.circular(150)),
                    border: Border.all(
                        color: changeWidthColor, width: changedWidth)),
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
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: () {
                stopAudio();

                setState(() {
                  stopCounter = true;
                  screensIndex = 3;
                  changeFillColor = const Color(0XFF79AC78).withOpacity(0.5);
                  changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
                  changedText = 'Prepare-se';
                  changedWidth = 10;
                });

                timer0.cancel();
                timer1.cancel();
                timer2.cancel();
                timer3.cancel();
                timer4.cancel();
                timer5.cancel();
                timer6.cancel();
                timer7.cancel();
                timer8.cancel();
                timer9.cancel();
                timer10.cancel();
                timer11.cancel();
                timer12.cancel();
                timer13.cancel();
                timer14.cancel();
                timer15.cancel();
                timer16.cancel();
                timer17.cancel();
                timer18.cancel();
                timer19.cancel();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE97777),
                minimumSize: const Size(200, 60),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              child: Text(
                'Parar',
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
