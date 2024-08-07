// ADICIONAR PARADA QUANDO ALTERAR PAGINAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
// if (buttonIndex != 1) {
//   BreathePage();
// }

import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'dart:io';
// import 'package:deepgram_speech_to_text/deepgram_speech_to_text.dart';

// void tts() async {
//   String apiKey = "dffabc0c004db35c034e1b4756c5486fa29cbca9";

//   Map<String, dynamic> params = {
//     'model': 'nova-2-general',
//     'detect_language': true,
//     'filler_words': false,
//     'punctuation': true,
//   };
// Deepgram deepgram = Deepgram(apiKey, baseQueryParams: {
//   'model': 'aura-asteria-en',
//   'encoding': "linear16",
//   'container': "wav",
//   // options here: https://developers.deepgram.com/reference/text-to-speech-api

//   final  res = await deepgram.speakFromText('Hello world');
//   print(res.data); // raw audio data that you can use as you wish. Check flutter example for a simple player
// });

//   // check if the API key is valid
//   final isValid = await deepgram.isApiKeyValid();
//   print('API key is valid: $isValid');

//   final dg = Deepgram(apiKey);
//   final res3 = await dg.speakFromText('Hello, how are you?');
//   // then use res as you like
//   res3.data; // Uint8List of audio data
//   res3.contentType; // 'audio/wav'
//   print(res3.contentType);

// }

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
      'name': 'pt-br-x-ptd-local',
      'locale': 'pt-BR',
    };
    await flutterTts.awaitSpeakCompletion(false);

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
  dynamic timer20;

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
    timer20?.cancel();
    // startBreathe();
    super.dispose();
  }

  @override
  void initState() {
    // tts();
    super.initState();
  }

  void changeDetails() {
    if (mounted) {
      Timer(const Duration(milliseconds: 500), () {
        playAudio();
      });

      Future.delayed(const Duration(seconds: 5), () {
        for (int i = 0; i < 21; i++) {
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
            case 20:
              setState(() {
                timer20 = Timer(const Duration(seconds: 103), () {
                  setState(() {
                    changeFillColor = const Color(0XFF79AC78).withOpacity(0.4);
                    changeWidthColor = const Color(0xFFC4DFDF).withOpacity(0.5);
                    changedText = 'Respire normalmente';
                    speak('Para finalizar, respire normalmente', 0.30);
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
              'Encontre um lugar tranquilo e\n silencioso...',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
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
                  style: Theme.of(context).textTheme.bodySmall,
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
              style: Theme.of(context).textTheme.displaySmall,
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
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        screensIndex = 2;
                      });
                    },
                    child: Text(
                      'Continuar',
                      style: Theme.of(context).textTheme.bodySmall,
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
            width: 256,
            height: 256,
            child: SvgPicture.asset('lib/assets/images/headphones.svg'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 150),
            child: Text(
              'Para uma melhor experiência, utilize fones de ouvido...',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
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
                        screensIndex = 1;
                      });
                    },
                    child: Text(
                      'Voltar',
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        screensIndex = 3;
                      });
                    },
                    child: Text(
                      'Continuar',
                      style: Theme.of(context).textTheme.bodySmall,
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
            backgroundColor:
                Theme.of(context).buttonTheme.colorScheme!.primary),
        child: Text(
          'Iniciar',
          style: Theme.of(context).textTheme.displayLarge,
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

                if (timer0 != null) {
                  timer0.cancel();
                }
                if (timer1 != null) {
                  timer1.cancel();
                }
                if (timer2 != null) {
                  timer2.cancel();
                }
                if (timer3 != null) {
                  timer3.cancel();
                }
                if (timer4 != null) {
                  timer4.cancel();
                }
                if (timer5 != null) {
                  timer5.cancel();
                }
                if (timer6 != null) {
                  timer6.cancel();
                }
                if (timer7 != null) {
                  timer7.cancel();
                }
                if (timer8 != null) {
                  timer8.cancel();
                }
                if (timer9 != null) {
                  timer9.cancel();
                }
                if (timer10 != null) {
                  timer10.cancel();
                }
                if (timer11 != null) {
                  timer11.cancel();
                }
                if (timer12 != null) {
                  timer12.cancel();
                }
                if (timer13 != null) {
                  timer13.cancel();
                }
                if (timer14 != null) {
                  timer14.cancel();
                }
                if (timer15 != null) {
                  timer15.cancel();
                }
                if (timer16 != null) {
                  timer16.cancel();
                }
                if (timer17 != null) {
                  timer17.cancel();
                }
                if (timer18 != null) {
                  timer18.cancel();
                }
                if (timer19 != null) {
                  timer19.cancel();
                }
                if (timer20 != null) {
                  timer20.cancel();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).buttonTheme.colorScheme!.onSecondary,
                minimumSize: const Size(200, 60),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              child: Text(
                'Parar',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
