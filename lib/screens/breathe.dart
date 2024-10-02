import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:viver/controllers/home_app_controller.dart';

class BreathePage extends StatefulWidget {
  const BreathePage({super.key});

  @override
  State<BreathePage> createState() => _BreathePage();
}

class _BreathePage extends State<BreathePage>
    with AutomaticKeepAliveClientMixin {
  bool isVoicePlaying = true;
  bool isMusicPlaying = true;

  @override
  bool get wantKeepAlive => true;

  Future<void> speak(String text) async {
    FlutterTts tts = FlutterTts();
    await tts.setLanguage('pt-BR');
    await tts.setSpeechRate(0.3);
    await tts.setPitch(0.8);
    await tts.setVoice({
      "name": "pt-br-x-ptd-network",
      "locale": "pt-BR",
    });

    await tts.speak(text);
  }

  Future<void> muteVoice() async {
    FlutterTts tts = FlutterTts();
    await tts.setVolume(0);
  }

  Future<void> listenVoice() async {
    FlutterTts tts = FlutterTts();
    await tts.setVolume(1);
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
    super.dispose();
  }

  void changeDetails() {
    if (mounted) {
      Timer(const Duration(milliseconds: 500), () {
        context.read<HomeAppController>().playMusic();
      });
    }
    if (mounted) {
      Future.delayed(const Duration(seconds: 5), () {
        for (int i = 0; i < 21; i++) {
          if (stopCounter == true) {
            break;
          }

          switch (i) {
            case 0:
              if (mounted) {
                setState(() {
                  timer0 = Timer(const Duration(seconds: 3), () {
                    setState(() {
                      changeFillColor =
                          const Color(0XFF79AC78).withOpacity(0.4);
                      changeWidthColor =
                          const Color(0xFFC4DFDF).withOpacity(0.5);
                      changedText = 'Inspire';
                      speak('Inspire profundamente');
                    });
                  });
                });
              }

              break;
            case 1:
              if (mounted) {
                setState(() {
                  timer1 = Timer(const Duration(seconds: 8), () {
                    setState(() {
                      changeFillColor =
                          const Color(0xFFF5DD61).withOpacity(0.7);
                      changeWidthColor =
                          const Color(0xFFF5DD61).withOpacity(0.4);
                      changedText = 'Segure o ar';
                      speak('Segure o ar');
                    });
                  });
                });
              }

              break;
            case 2:
              if (mounted) {
                setState(() {
                  timer2 = Timer(const Duration(seconds: 13), () {
                    setState(() {
                      changeFillColor =
                          const Color(0XFF79AC78).withOpacity(0.4);
                      changeWidthColor =
                          const Color(0xFFC4DFDF).withOpacity(0.5);
                      changedText = 'Expire';
                      speak('Expire pelo nariz lentamente');
                    });
                  });
                });
              }

              break;
            case 3:
              if (mounted) {
                setState(() {
                  timer3 = Timer(const Duration(seconds: 18), () {
                    setState(() {
                      changeFillColor =
                          const Color(0xFFF5DD61).withOpacity(0.7);
                      changeWidthColor =
                          const Color(0xFFF5DD61).withOpacity(0.4);
                      changedText = 'Segure sem ar';
                      speak('Segure sem ar por alguns segundos');
                    });
                  });
                });
              }

              break;
            case 4:
              if (mounted) {
                setState(() {
                  timer4 = Timer(const Duration(seconds: 23), () {
                    setState(() {
                      changeFillColor =
                          const Color(0XFF79AC78).withOpacity(0.4);
                      changeWidthColor =
                          const Color(0xFFC4DFDF).withOpacity(0.5);
                      changedText = 'Inspire';
                      speak('Inspire profundamente');
                    });
                  });
                });
              }

              break;
            case 5:
              if (mounted) {
                setState(() {
                  timer5 = Timer(const Duration(seconds: 28), () {
                    setState(() {
                      changeFillColor =
                          const Color(0xFFF5DD61).withOpacity(0.7);
                      changeWidthColor =
                          const Color(0xFFF5DD61).withOpacity(0.4);
                      changedText = 'Segure o ar';
                      speak('Segure o ar');
                    });
                  });
                });
              }

              break;
            case 6:
              if (mounted) {
                setState(() {
                  timer6 = Timer(const Duration(seconds: 33), () {
                    setState(() {
                      changeFillColor =
                          const Color(0XFF79AC78).withOpacity(0.4);
                      changeWidthColor =
                          const Color(0xFFC4DFDF).withOpacity(0.5);
                      changedText = 'Expire';
                      speak('Expire pelo nariz lentamente');
                    });
                  });
                });
              }

              break;
            case 7:
              if (mounted) {
                setState(() {
                  timer7 = Timer(const Duration(seconds: 38), () {
                    setState(() {
                      changeFillColor =
                          const Color(0xFFF5DD61).withOpacity(0.7);
                      changeWidthColor =
                          const Color(0xFFF5DD61).withOpacity(0.4);
                      changedText = 'Segure sem ar';
                      speak('Segure sem ar por alguns segundos');
                    });
                  });
                });
              }

              break;
            case 8:
              if (mounted) {
                setState(() {
                  timer8 = Timer(const Duration(seconds: 43), () {
                    setState(() {
                      changeFillColor =
                          const Color(0XFF79AC78).withOpacity(0.4);
                      changeWidthColor =
                          const Color(0xFFC4DFDF).withOpacity(0.5);
                      changedText = 'Inspire';
                      speak('Inspire profundamente');
                    });
                  });
                });
              }

              break;
            case 9:
              if (mounted) {
                setState(() {
                  timer9 = Timer(const Duration(seconds: 48), () {
                    setState(() {
                      changeFillColor =
                          const Color(0xFFF5DD61).withOpacity(0.7);
                      changeWidthColor =
                          const Color(0xFFF5DD61).withOpacity(0.4);
                      changedText = 'Segure o ar';
                      speak('Segure o ar');
                    });
                  });
                });
              }

              break;
            case 10:
              if (mounted) {
                setState(() {
                  timer10 = Timer(const Duration(seconds: 53), () {
                    setState(() {
                      changeFillColor =
                          const Color(0XFF79AC78).withOpacity(0.4);
                      changeWidthColor =
                          const Color(0xFFC4DFDF).withOpacity(0.5);
                      changedText = 'Expire';
                      speak('Expire pelo nariz lentamente');
                    });
                  });
                });
              }

              break;
            case 11:
              if (mounted) {
                setState(() {
                  timer11 = Timer(const Duration(seconds: 58), () {
                    setState(() {
                      changeFillColor =
                          const Color(0xFFF5DD61).withOpacity(0.7);
                      changeWidthColor =
                          const Color(0xFFF5DD61).withOpacity(0.4);
                      changedText = 'Segure sem ar';
                      speak('Segure sem ar por alguns segundos');
                    });
                  });
                });
              }

              break;
            case 12:
              if (mounted) {
                setState(() {
                  timer12 = Timer(const Duration(seconds: 63), () {
                    setState(() {
                      changeFillColor =
                          const Color(0XFF79AC78).withOpacity(0.4);
                      changeWidthColor =
                          const Color(0xFFC4DFDF).withOpacity(0.5);
                      changedText = 'Inspire';
                      speak('Inspire profundamente');
                    });
                  });
                });
              }

              break;
            case 13:
              if (mounted) {
                setState(() {
                  timer13 = Timer(const Duration(seconds: 68), () {
                    setState(() {
                      changeFillColor =
                          const Color(0xFFF5DD61).withOpacity(0.7);
                      changeWidthColor =
                          const Color(0xFFF5DD61).withOpacity(0.4);
                      changedText = 'Segure o ar';
                      speak('Segure o ar');
                    });
                  });
                });
              }

              break;
            case 14:
              if (mounted) {
                setState(() {
                  timer14 = Timer(const Duration(seconds: 73), () {
                    setState(() {
                      changeFillColor =
                          const Color(0XFF79AC78).withOpacity(0.4);
                      changeWidthColor =
                          const Color(0xFFC4DFDF).withOpacity(0.5);
                      changedText = 'Expire';
                      speak('Expire pelo nariz lentamente');
                    });
                  });
                });
              }

              break;
            case 15:
              if (mounted) {
                setState(() {
                  timer15 = Timer(const Duration(seconds: 78), () {
                    setState(() {
                      changeFillColor =
                          const Color(0xFFF5DD61).withOpacity(0.7);
                      changeWidthColor =
                          const Color(0xFFF5DD61).withOpacity(0.4);
                      changedText = 'Segure sem ar';
                      speak('Segure sem ar por alguns segundos');
                    });
                  });
                });
              }

              break;
            case 16:
              if (mounted) {
                setState(() {
                  timer16 = Timer(const Duration(seconds: 83), () {
                    setState(() {
                      changeFillColor =
                          const Color(0XFF79AC78).withOpacity(0.4);
                      changeWidthColor =
                          const Color(0xFFC4DFDF).withOpacity(0.5);
                      changedText = 'Inspire';
                      speak('Inspire profundamente');
                    });
                  });
                });
              }

              break;
            case 17:
              if (mounted) {
                setState(() {
                  timer17 = Timer(const Duration(seconds: 88), () {
                    setState(() {
                      changeFillColor =
                          const Color(0xFFF5DD61).withOpacity(0.7);
                      changeWidthColor =
                          const Color(0xFFF5DD61).withOpacity(0.4);
                      changedText = 'Segure o ar';
                      speak('Segure o ar');
                    });
                  });
                });
              }

              break;
            case 18:
              if (mounted) {
                setState(() {
                  timer18 = Timer(const Duration(seconds: 93), () {
                    setState(() {
                      changeFillColor =
                          const Color(0XFF79AC78).withOpacity(0.4);
                      changeWidthColor =
                          const Color(0xFFC4DFDF).withOpacity(0.5);
                      changedText = 'Expire';
                      speak('Expire pelo nariz lentamente');
                    });
                  });
                });
              }

              break;
            case 19:
              if (mounted) {
                setState(() {
                  timer19 = Timer(const Duration(seconds: 98), () {
                    setState(() {
                      changeFillColor =
                          const Color(0xFFF5DD61).withOpacity(0.7);
                      changeWidthColor =
                          const Color(0xFFF5DD61).withOpacity(0.4);
                      changedText = 'Segure sem ar';
                      speak('Segure sem ar por alguns segundos');
                    });
                  });
                });
              }

              break;
            case 20:
              if (mounted) {
                setState(() {
                  timer20 = Timer(const Duration(seconds: 103), () {
                    setState(() {
                      changeFillColor =
                          const Color(0XFF79AC78).withOpacity(0.4);
                      changeWidthColor =
                          const Color(0xFFC4DFDF).withOpacity(0.5);
                      changedText = 'Respire normalmente';
                      speak('Para finalizar, respire normalmente');
                    });
                  });
                });
              }

              break;

            default:
          }
        }
      });
    } else {
      context.read<HomeAppController>().stopMusic();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // return Container(
    //   color: Colors.red,
    //   child: Center(child: Text(_controller.player.state.toString())),
    // );
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
                context.read<HomeAppController>().stopMusic();

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
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isVoicePlaying)
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isVoicePlaying = !isVoicePlaying;
                        });
                        if (isVoicePlaying == false) {
                          muteVoice();
                        }
                      },
                      icon: Icon(
                        Icons.record_voice_over_rounded,
                        color:
                            Theme.of(context).buttonTheme.colorScheme!.primary,
                        size: 30,
                      ),
                    ),
                  if (!isVoicePlaying)
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isVoicePlaying = !isVoicePlaying;
                        });
                        if (isVoicePlaying == true) {
                          listenVoice();
                        }
                      },
                      icon: Icon(
                        Icons.voice_over_off_rounded,
                        color:
                            Theme.of(context).buttonTheme.colorScheme!.surface,
                        size: 30,
                      ),
                    ),
                  if (isMusicPlaying)
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isMusicPlaying = !isMusicPlaying;
                        });
                        if (isMusicPlaying == false) {
                          context.read<HomeAppController>().muteMusic();
                        }
                      },
                      icon: Icon(
                        Icons.music_note_rounded,
                        color:
                            Theme.of(context).buttonTheme.colorScheme!.primary,
                        size: 30,
                      ),
                    ),
                  if (!isMusicPlaying)
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isMusicPlaying = !isMusicPlaying;
                        });
                        if (isMusicPlaying == true) {
                          context.read<HomeAppController>().listenMusic();
                        }
                      },
                      icon: Icon(
                        Icons.music_off_rounded,
                        color:
                            Theme.of(context).buttonTheme.colorScheme!.surface,
                        size: 30,
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
